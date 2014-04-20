//
//  ImageFetcher.h
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageFetcher : NSObject <NSURLConnectionDataDelegate>

+ (void) reset;
+ (void) getImageFromURL:(NSURL *)url thenPerform:(void (^)(UIImage *)) callback;
@end
