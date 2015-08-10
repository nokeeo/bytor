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
    [super renderView: view withStyle: style];
    
    
    //Text Color
    NSString *property = @"text-color";
    if([style hasProperty: property]) {
        [self setTitleColorForButton: view forState: UIControlStateNormal withStyle: style withProperty: property];
    }
    
    property = @"text-color-highlighted";
    if([style hasProperty: property]) {
        [self setTitleColorForButton: view forState: UIControlStateHighlighted withStyle: style withProperty: property];
    }
    
    property = @"text-color-disabled";
    if([style hasProperty: property]) {
        [self setTitleColorForButton: view forState: UIControlStateDisabled withStyle: style withProperty: property];
    }
    
    property = @"text-color-selected";
    if([style hasProperty: property]) {
        [self setTitleColorForButton: view forState: UIControlStateSelected withStyle: style withProperty: property];
    }
    
    //Text Shadow Color
    property = @"text-shadow-color";
    if([style hasProperty: property]) {
        [self setTitleShadowColorForButton: view forState: UIControlStateNormal withStyle: style withProperty: property];
    }
    
    property = @"text-shadow-color-highlighted";
    if([style hasProperty: property]) {
        [self setTitleShadowColorForButton: view forState: UIControlStateHighlighted withStyle: style withProperty: property];
    }
    
    property = @"text-shadow-color-disabled";
    if([style hasProperty: property]) {
        [self setTitleShadowColorForButton: view forState: UIControlStateDisabled withStyle: style withProperty: property];
    }
    
    property = @"text-shadow-color-selected";
    if([style hasProperty: property]) {
        [self setTitleShadowColorForButton: view forState: UIControlStateSelected withStyle: style withProperty: property];
    }
    
    //Padding
    property = @"padding";
    if([style hasProperty: property]) {
        NSArray *values = [style valueForProperty: property];
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: values];
        view.contentEdgeInsets = insets;
    }
    
    property = @"title-padding";
    if([style hasProperty: property]) {
        NSArray *values = [style valueForProperty: property];
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: values];
        view.titleEdgeInsets = insets;
    }
    
    property = @"image-padding";
    if([style hasProperty: property]) {
        NSArray *values = [style valueForProperty: property];
        UIEdgeInsets insets = [BYRendererUtility insetsFromValues: values];
        view.imageEdgeInsets = insets;
    }
}

#pragma mark - Helper Functions

-(void) setTitleColorForButton:(UIButton *) button forState:(UIControlState)state withStyle: (BYStyle *) style withProperty: (NSString *) property {
    UIColor *color = [style valueForProperty: property];
    [button setTitleColor: color forState: state];
}

-(void) setTitleShadowColorForButton: (UIButton *) button forState: (UIControlState) state withStyle: (BYStyle *) style withProperty: (NSString *) property {
    UIColor *color = [style valueForProperty: property];
    [button setTitleShadowColor: color forState: state];
}

@end
