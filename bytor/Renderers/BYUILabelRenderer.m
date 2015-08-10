//
//  BYUILabelRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUILabelRenderer.h"
#import "BYRendererUtility.h"

@implementation BYUILabelRenderer

-(void) renderView:(UILabel *)view withStyle:(BYStyle *)style {
    [super renderView: view withStyle: style];
    
    [self renderProperty: @"text-size" withStyle: style withOperation:^(id value) {
        UIFont *curFont = view.font;
        view.font = [UIFont fontWithName: curFont.familyName size: [value floatValue]];
    }];
    
    [self renderProperty: @"font" withStyle: style withOperation:^(id value) {
        UIFont *curFont = view.font;
        view.font = [UIFont fontWithName: value size: curFont.pointSize];
    }];
    
    [self renderProperty: @"text-align" withStyle: style withOperation:^(id value) {
        NSTextAlignment textAlign = [BYRendererUtility textAlignmentForString: value];
        if(textAlign) {
            view.textAlignment = textAlign;
        }
    }];
    
    [self renderProperty: @"text-color" withStyle: style withOperation:^(id value) {
        view.textColor = value;
    }];
}

@end
