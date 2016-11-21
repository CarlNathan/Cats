//
//  DataHelper.m
//  Cats
//
//  Created by Carl Udren on 11/21/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "DataHelper.h"
#import "Photo.h"


@implementation DataHelper

+ (void) fetchPhotosFromTag: (NSString*) tag completion: (void (^)(NSArray* array))completionBlock {
    NSString* urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&format=json&api_key=%@&tags=%@", @"7615eeced193312748279519f186bcbe", tag];
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (!error) {
            NSError *jsonParsingError;
            NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
            if (!jsonParsingError) {
                NSLog(@"%@", jsonData);
                
                NSMutableArray *photoArray = [NSMutableArray new];
                for (NSDictionary* dict in jsonData[@"photos"][@"photo"]) {
                    NSString* farm = dict[@"farm"];
                    NSString* server = dict[@"server"];
                    NSString* ID = dict[@"id"];
                    NSString* secret = dict[@"secret"];
                    Photo* photo = [Photo photoFrom:farm server:server ID:ID secret:secret];
                    [photoArray addObject:photo];
                }
                
                completionBlock(photoArray.copy);
                
            }
        }
    }];
    [task resume];
    }

@end
