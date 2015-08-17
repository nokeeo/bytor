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
    
    NSArray *colorTypes = @[[UIColor class]];
    NSArray *numberTypes = @[[NSNumber class]];
    NSArray *stringTypes = @[[NSString class]];
    
    //Text Color
    [self renderProperty: @"text-color" withStyle: style withTypeClasses: colorTypes withOperation:^(id value) {
        [view setTitleColor: value forState: UIControlStateNormal];
    }];
    
    [self renderProperty: @"text-color-highlighted" withStyle: style withTypeClasses: colorTypes withOperation:^(id value) {
        [view setTitleColor: value forState: UIControlStateHighlighted];
    }];
    
    [self renderProperty: @"text-color-disabled" withStyle: style withTypeClasses: colorTypes withOperation:^(id value) {
        [view setTitleColor: value forState: UIControlStateDisabled];
    }];
    
    [self renderProperty: @"text-color-selected" withStyle: style withTypeClasses: colorTypes withOperation:^(id value) {
        [view setTitleColor: value forState: UIControlStateSelected];
    }];
    
    //Text Shadow Color
    [self renderProperty: @"text-shadow-color" withStyle: style withTypeClasses: colorTypes withOperation:^(id value) {
        [view setTitleShadowColor: value forState: UIControlStateNormal];
    }];
    
    [self renderProperty: @"text-shadow-color-highlighted" withStyle: style withTypeClasses: colorTypes withOperation:^(id value) {
        [view setTitleShadowColor: value forState: UIControlStateHighlighted];
    }];
    
    [self renderProperty: @"text-shadow-color-disabled" withStyle: style withTypeClasses: colorTypes withOperation:^(id value) {
        [view setTitleShadowColor: value forState: UIControlStateDisabled];
    }];
    
    [self renderProperty: @"text-shadow-color-selected" withStyle: style withTypeClasses: colorTypes withOperation:^(id value) {
        [view setTitleShadowColor: value forState: UIControlStateSelected];
    }];
    
    //Padding
    [self renderProperty: @"padding" withStyle: style withTypeClasses: numberTypes withOperation:^(id value) {
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: value];
        view.contentEdgeInsets = insets;
    }];
    
    [self renderProperty: @"title-padding" withStyle: style withTypeClasses: numberTypes withOperation:^(id value) {
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: value];
        view.titleEdgeInsets = insets;
    }];
    
    [self renderProperty: @"image-padding" withStyle: style withTypeClasses: numberTypes withOperation:^(id value) {
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: value];
        view.imageEdgeInsets = insets;
    }];
    
    //Image
    [self renderProperty: @"image" withStyle: style withTypeClasses: stringTypes withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setImage: image forState: UIControlStateNormal];
    }];
    
    [self renderProperty: @"image-highlighted" withStyle: style withTypeClasses: stringTypes withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setImage: image forState: UIControlStateHighlighted];
    }];
    
    [self renderProperty: @"image-disabled" withStyle: style withTypeClasses: stringTypes withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setImage: image forState: UIControlStateDisabled];
    }];
    
    [self renderProperty: @"image-selected" withStyle: style withTypeClasses: stringTypes withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setImage: image forState: UIControlStateSelected];
    }];
    
    //Background Image
    [self renderProperty: @"background-image" withStyle: style withTypeClasses: stringTypes withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setBackgroundImage: image forState: UIControlStateNormal];
    }];
    
    [self renderProperty: @"background-image-highlighted" withStyle: style withTypeClasses: stringTypes withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setBackgroundImage: image forState: UIControlStateHighlighted];
    }];
    
    [self renderProperty: @"background-image-disabled" withStyle: style withTypeClasses: stringTypes withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setBackgroundImage: image forState: UIControlStateDisabled];
    }];
    
    [self renderProperty: @"background-image-selected" withStyle: style withTypeClasses: stringTypes withOperation:^(id value) {
        UIImage *image = [UIImage imageNamed: value];
        [view setBackgroundImage: image forState: UIControlStateSelected];
    }];
    
    [super renderView: view withStyle: style];
}

@end
