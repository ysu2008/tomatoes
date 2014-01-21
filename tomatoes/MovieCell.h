//
//  MovieCell.h
//  tomatoes
//
//  Created by Yang Su on 1/21/14.
//  Copyright (c) 2014 Yang Su. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (nonatomic, weak, readwrite) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak, readwrite) IBOutlet UILabel *synopsisLabel;

@end
