//
//  Movie.m
//  tomatoes
//
//  Created by Yang Su on 1/21/14.
//  Copyright (c) 2014 Yang Su. All rights reserved.
//

#import "Movie.h"

@interface Movie()

@property (nonatomic, readwrite, strong) NSString *title;
@property (nonatomic, readwrite, strong) NSString *synopsis;
@property (nonatomic, readwrite, strong) NSString *cast;

@end

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]){
        _title = dictionary[@"title"];
        _synopsis = dictionary[@"synopsis"];
    }
    return self;
}

@end
