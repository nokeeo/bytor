//
//  BYRendererUtility.m
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYRendererUtility.h"

@implementation BYRendererUtility

+(CGSize)sizeFromValues:(NSArray *)values {
    if([values count] > 1) {
        id width = [values objectAtIndex: 0];
        id height = [values objectAtIndex: 1];
        if([width isKindOfClass: [NSNumber class]] && [height isKindOfClass: [NSNumber class]]) {
            return CGSizeMake([width floatValue], [height floatValue]);
        }
    }
    
    return CGSizeZero;
}

+(UIEdgeInsets) insetsFromValues:(NSArray *)values {
    if([values count] == 4) {
        CGFloat top = [[values objectAtIndex: 0] floatValue];
        CGFloat left = [[values objectAtIndex: 1] floatValue];
        CGFloat bottom = [[values objectAtIndex: 2] floatValue];
        CGFloat right = [[values objectAtIndex: 3] floatValue];
        
        return UIEdgeInsetsMake(top, left, bottom, right);
    }
    
    return UIEdgeInsetsZero;
}

@end
