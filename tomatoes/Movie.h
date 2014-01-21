//
//  Movie.h
//  tomatoes
//
//  Created by Yang Su on 1/21/14.
//  Copyright (c) 2014 Yang Su. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSString *synopsis;
@property (nonatomic, readonly, strong) NSString *cast;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
