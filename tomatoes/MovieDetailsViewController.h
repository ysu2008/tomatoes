//
//  MovieDetailsViewController.h
//  tomatoes
//
//  Created by Yang Su on 1/21/14.
//  Copyright (c) 2014 Yang Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Movie;

@interface MovieDetailsViewController : UITableViewController

@property (nonatomic, weak) Movie *movie;

@end
