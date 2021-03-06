//
//  BYRendererUtility.h
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BYRendererUtility : NSObject

+(CGSize) sizeFromValues: (NSArray *) values;
+(UIEdgeInsets) insetsFromValues: (NSArray *) values;
+(NSTextAlignment) textAlignmentForString: (NSString *) value;
+(UIControlContentHorizontalAlignment) horizontalAlignmentForString: (NSString *) value;
+(UIControlContentVerticalAlignment) verticalAlignmentForString: (NSString *) value;
+(UITextBorderStyle) textBorderStyleForString: (NSString *) value;

@end
