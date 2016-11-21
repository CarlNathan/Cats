//
//  Photo.m
//  Cats
//
//  Created by Carl Udren on 11/21/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "Photo.h"

@implementation Photo

+ (instancetype) photoFrom: (NSString*)farm server: (NSString*) server ID: (NSString*) ID secret: (NSString*) secret {
    Photo* photo = [[Photo alloc] init];
    photo.farm = farm;
    photo.server = server;
    photo.ID = ID;
    photo.secret = secret;
    photo.url = [NSString stringWithFormat: @"https://farm%@.staticflickr.com/%@/%@_%@.jpg", farm, server, ID, secret];
    return photo;
}

@end
