//
//  MovieDetailsCell.h
//  tomatoes
//
//  Created by Yang Su on 1/21/14.
//  Copyright (c) 2014 Yang Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsCell : UITableViewCell

@property (nonatomic, weak, readwrite) IBOutlet UILabel *synopsisLabel;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *castLabel;
@property (nonatomic, weak, readwrite) IBOutlet UIImageView *moviePosterImage;

@end
