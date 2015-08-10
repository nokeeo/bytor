//
//  BYUIViewRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUIViewRenderer.h"
#import "BYRendererUtility.h"

@implementation BYUIViewRenderer

-(void) renderView:(UIView *)view withStyle:(BYStyle *)style {
    [self renderProperty: @"opacity" withStyle: style withOperation:^(id value) {
        view.alpha = [value floatValue];
    }];
    
    [self renderProperty: @"background-color" withStyle: style withOperation:^(id value) {
        view.backgroundColor = value;
    }];
    
    [self renderProperty: @"border-width" withStyle: style withOperation:^(id value) {
        view.layer.borderWidth = [value floatValue];
    }];
    
    [self renderProperty: @"border-color" withStyle: style withOperation:^(id value) {
        view.layer.borderColor = [value CGColor];
    }];
    
    [self renderProperty: @"border-radius" withStyle: style withOperation:^(id value) {
        view.layer.cornerRadius = [value floatValue];
    }];
    
    [self renderProperty: @"tint-color" withStyle: style withOperation:^(id value) {
        view.tintColor = value;
    }];
    
    [self renderProperty: @"shadow-color" withStyle: style withOperation:^(id value) {
        view.layer.shadowColor = [value CGColor];
    }];
    
    [self renderProperty: @"shadow-opacity" withStyle: style withOperation:^(id value) {
        view.layer.shadowOpacity = [value floatValue];
    }];
    
    [self renderProperty: @"shadow-radius" withStyle: style withOperation:^(id value) {
        view.layer.shadowRadius = [value floatValue];
    }];
    
    [self renderProperty: @"shadow-offset" withStyle: style withOperation:^(id value) {
        NSArray *sizeValues = value;
        CGSize offset = [BYRendererUtility sizeFromValues: sizeValues];
        view.layer.shadowOffset = offset;
    }];
}

@end
