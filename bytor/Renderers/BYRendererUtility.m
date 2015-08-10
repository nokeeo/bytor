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

+(NSTextAlignment) textAlignmentForString: (NSString *) value {
    if([value isEqual: @"left"]) {
        return NSTextAlignmentLeft;
    }
    else if([value isEqual: @"center"]) {
        return NSTextAlignmentCenter;
    }
    else if([value isEqual: @"right"]) {
        return NSTextAlignmentRight;
    }
    else if([value isEqual: @"justified"]) {
        return NSTextAlignmentJustified;
    }
    else if([value isEqual: @"natural"]) {
        return NSTextAlignmentNatural;
    }
    return -1;
}

+(UIControlContentHorizontalAlignment) horizontalAlignmentForString:(NSString *)value {
    if([value isEqual: @"center"]) {
        return UIControlContentHorizontalAlignmentCenter;
    }
    else if([value isEqual: @"right"]) {
        return UIControlContentHorizontalAlignmentRight;
    }
    else if([value isEqual: @"fill"]) {
        return UIControlContentHorizontalAlignmentFill;
    }
    else {
        return UIControlContentHorizontalAlignmentLeft;
    }
}

+(UIControlContentVerticalAlignment) verticalAlignmentForString:(NSString *)value {
    if([value isEqual: @"center"]) {
        return UIControlContentVerticalAlignmentCenter;
    }
    else if([value isEqual: @"bottom"]) {
        return UIControlContentVerticalAlignmentBottom;
    }
    else if([value isEqual: @"fill"]) {
        return UIControlContentVerticalAlignmentFill;
    }
    else {
        return UIControlContentVerticalAlignmentTop;
    }
}

@end
