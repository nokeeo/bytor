//
//  BYUIButtonRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUIButtonRenderer.h"
#import "BYRendererUtility.h"

@implementation BYUIButtonRenderer

-(void) renderView:(UIButton *)view withStyle:(BYStyle *)style {
    //Text Color
    [self renderProperty: @"text-color" withStyle: style withOperation:^(id value) {
        [view setTitleColor: value forState: UIControlStateNormal];
    }];
    
    [self renderProperty: @"text-color-highlighted" withStyle: style withOperation:^(id value) {
        [view setTitleColor: value forState: UIControlStateHighlighted];
    }];
    
    [self renderProperty: @"text-color-disabled" withStyle: style withOperation:^(id value) {
        [view setTitleColor: value forState: UIControlStateDisabled];
    }];
    
    [self renderProperty: @"text-color-selected" withStyle: style withOperation:^(id value) {
        [view setTitleColor: value forState: UIControlStateSelected];
    }];
    
    //Text Shadow Color
    [self renderProperty: @"text-shadow-color" withStyle: style withOperation:^(id value) {
        [view setTitleShadowColor: value forState: UIControlStateNormal];
    }];
    
    [self renderProperty: @"text-shadow-color-highlighted" withStyle: style withOperation:^(id value) {
        [view setTitleShadowColor: value forState: UIControlStateHighlighted];
    }];
    
    [self renderProperty: @"text-shadow-color-disabled" withStyle: style withOperation:^(id value) {
        [view setTitleShadowColor: value forState: UIControlStateDisabled];
    }];
    
    [self renderProperty: @"text-shadow-color-selected" withStyle: style withOperation:^(id value) {
        [view setTitleShadowColor: value forState: UIControlStateSelected];
    }];
    
    //Padding
    [self renderProperty: @"padding" withStyle: style withOperation:^(id value) {
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: value];
        view.contentEdgeInsets = insets;
    }];
    
    [self renderProperty: @"title-padding" withStyle: style withOperation:^(id value) {
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: value];
        view.titleEdgeInsets = insets;
    }];
    
    [self renderProperty: @"image-padding" withStyle: style withOperation:^(id value) {
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: value];
        view.imageEdgeInsets = insets;
    }];
    
    //Image
    [self renderProperty: @"image" withStyle: style withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setImage: image forState: UIControlStateNormal];
    }];
    
    [self renderProperty: @"image-highlighted" withStyle: style withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setImage: image forState: UIControlStateHighlighted];
    }];
    
    [self renderProperty: @"image-disabled" withStyle: style withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setImage: image forState: UIControlStateDisabled];
    }];
    
    [self renderProperty: @"image-selected" withStyle: style withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setImage: image forState: UIControlStateSelected];
    }];
    
    [super renderView: view withStyle: style];
}

@end
