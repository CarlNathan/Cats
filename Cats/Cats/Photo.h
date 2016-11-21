//
//  Photo.h
//  Cats
//
//  Created by Carl Udren on 11/21/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSString* farm;
@property (nonatomic, strong) NSString* server;
@property (nonatomic, strong) NSString* ID;
@property (nonatomic, strong) NSString* secret;
@property (nonatomic, strong) NSString* url;

+ (instancetype) photoFrom: (NSString*)farm server: (NSString*) server ID: (NSString*) ID secret: (NSString*) secret;

@end
