//
//  BYUITextFieldRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/10/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUITextFieldRenderer.h"
#import "BYRendererUtility.h"

@implementation BYUITextFieldRenderer

-(void) renderView:(UITextField *)view withStyle:(BYStyle *)style {
    [self renderProperty: @"font" withStyle: style withOperation:^(id value) {
        UIFont *newFont = [UIFont fontWithName: value size: view.font.pointSize];
        view.font = newFont;
    }];
    
    [self renderProperty: @"text-size" withStyle: style withOperation:^(id value) {
        UIFont *newFont = [UIFont fontWithName: view.font.fontName size: [value floatValue]];
        view.font = newFont;
    }];
    
    [self renderProperty: @"min-text-size" withStyle: style withOperation:^(id value) {
        view.minimumFontSize = [value floatValue];
    }];
    
    [self renderProperty: @"text-color" withStyle: style withOperation:^(id value) {
        view.textColor = value;
    }];
    
    [self renderProperty: @"text-alignment" withStyle: style withOperation:^(id value) {
        view.textAlignment = [BYRendererUtility textAlignmentForString: value];
    }];
    
    [self renderProperty: @"border-style" withStyle: style withOperation:^(id value) {
        view.borderStyle = [BYRendererUtility textBorderStyleForString: value];
    }];
    
    [self renderProperty: @"background-image" withStyle: style withOperation:^(id value) {
        view.background = [UIImage imageNamed: value];
    }];
    
    [super renderView: view withStyle: style];
}

@end
