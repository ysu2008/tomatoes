//
//  MovieCell.m
//  tomatoes
//
//  Created by Yang Su on 1/21/14.
//  Copyright (c) 2014 Yang Su. All rights reserved.
//

#import "MovieCell.h"

@interface MovieCell()

@end

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
