//
//  BYUILabelRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUILabelRenderer.h"

@implementation BYUILabelRenderer

-(void) renderView:(UILabel *)view withStyle:(BYStyle *)style {
    [super renderView: view withStyle: style];
    
    CGFloat fontSize = view.font.pointSize;
    NSString *fontName = view.font.fontName;
    
    NSString *property = @"text-size";
    if([style hasProperty: property]) {
        fontSize = [[style valueForProperty: property] floatValue];
    }
    
    property = @"font";
    if([style hasProperty: property]) {
        fontName = [style valueForProperty: property];
    }
    
    //Set the font
    view.font = [UIFont fontWithName: fontName size: fontSize];
    
    property = @"text-align";
    if([style hasProperty: property]) {
        NSTextAlignment textAlign = [self textAlignmentForString: [style valueForProperty: property]];
        if(textAlign) {
            view.textAlignment = textAlign;
        }
    }
    
    property = @"text-color";
    if([style hasProperty: property]) {
        view.textColor = [style valueForProperty: property];
    }
}

#pragma mark - Helper Function
-(NSTextAlignment) textAlignmentForString: (NSString *) value {
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

@end
