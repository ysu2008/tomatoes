//
//  MoviesViewController.m
//  tomatoes
//
//  Created by Yang Su on 1/21/14.
//  Copyright (c) 2014 Yang Su. All rights reserved.
//

#import "MoviesViewController.h"

#import "Movie.h"
#import "MovieCell.h"
#import "MovieDetailsViewController.h"

#import <AFNetworking/UIImageView+AFNetworking.h>
#import <SVProgressHUD.h>

@interface MoviesViewController ()

@property (nonatomic, readwrite, strong) NSMutableArray *movies;

- (void)reload;
- (void)setup;

@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]){
        [self setup];
    }
    return self;
}

- (void)setup {
    _movies = [NSMutableArray array];
    self.title = @"Movies";
    [self reload];
}

- (void)reload {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        if (!connectionError && responseCode == 200){
            NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSArray *movies = [object objectForKey:@"movies"];
            for (NSDictionary *movieDictionary in movies){
                Movie *movie = [[Movie alloc] initWithDictionary:movieDictionary];
                [self.movies addObject:movie];
            }
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
        }
        else{
            //show error message
            NSLog(@"connectionError=%@", connectionError);
            NSLog(@"responseCode=%d", responseCode);
            [SVProgressHUD showErrorWithStatus:@"Oops, unable to load movies, check your internet!"];
        }
    }];
}

# pragma mark - table view methods
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    Movie *movie = self.movies[indexPath.row];
    
    cell.movieTitleLabel.text = movie.title;
    cell.synopsisLabel.text = movie.synopsis;
    [cell.moviePosterImage setImageWithURL:[NSURL URLWithString:movie.thumbnailImageURL]];
    cell.castLabel.text = movie.cast;
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SVProgressHUD show];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - storyboard navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UITableViewCell *selectedCell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedCell];
    Movie *movie = self.movies[indexPath.row];
    
    MovieDetailsViewController *movieDetailsViewController = (MovieDetailsViewController *)(segue.destinationViewController);
    movieDetailsViewController.movie = movie;
}

@end
