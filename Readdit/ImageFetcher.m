//
//  ImageFetcher.m
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "ImageFetcher.h"

static NSMutableDictionary *imageCache;

@implementation ImageFetcher

+ (void) reset
{
    if (imageCache) {
        [imageCache removeAllObjects];
    } else {
        imageCache = [[NSMutableDictionary alloc] init];
    }
}

+ (void) getImageFromURL:(NSURL *)url thenPerform:(void (^)(UIImage *))callback
{
    if ([imageCache objectForKey:url]) {
        callback([imageCache objectForKey:url]);
        return;
    }
    
    dispatch_async(dispatch_queue_create("getAsyncImageQueue", NULL),
       ^{
           UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
           [imageCache setObject:img forKey:url];
           callback(img);
       });
}

@end
