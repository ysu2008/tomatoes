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
@property (nonatomic, readwrite, strong) NSString *thumbnailImageURL;
@property (nonatomic, readwrite, strong) NSString *detailedImageURL;

@end

@implementation Movie

- (id)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]){
        _title = dictionary[@"title"];
        _synopsis = dictionary[@"synopsis"];
        _thumbnailImageURL = dictionary[@"posters"][@"thumbnail"];
        _detailedImageURL = dictionary[@"posters"][@"original"];
        NSMutableString *castString = [NSMutableString stringWithString:@""];
        for (NSDictionary *character in dictionary[@"abridged_cast"]){
            [castString appendString:[NSString stringWithFormat:@", %@", character[@"name"]]];
        }
        _cast = [castString substringFromIndex:2];
    }
    return self;
}

@end
