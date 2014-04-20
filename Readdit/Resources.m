//
//  Resources.m
//  Readdit
//
//  Created by Nicholas Wood on 4/20/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "Resources.h"

@implementation Resources

+ (NSDictionary *) getFontAttributes
{
    UIFont *font = [UIFont systemFontOfSize:14];
    return @{NSFontAttributeName: font};
}

@end
