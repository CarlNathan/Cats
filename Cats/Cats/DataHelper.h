//
//  DataHelper.h
//  Cats
//
//  Created by Carl Udren on 11/21/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHelper : NSObject

+ (void) fetchPhotosFromTag: (NSString*) tag completion: (void (^)(NSArray* array))completionBlock;

@end
