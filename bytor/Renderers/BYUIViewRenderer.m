//
//  BYUIViewRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUIViewRenderer.h"

@implementation BYUIViewRenderer

-(void) renderView:(UIView *)view withStyle:(BYStyle *)style {
    NSString *property = @"opacity";
    if([style hasProperty: property]) {
        NSNumber *opacityValue = [style valueForProperty: property];
        view.alpha = [opacityValue floatValue];
    }
    
    property = @"background-color";
    if([style hasProperty: property]) {
        view.backgroundColor = [style valueForProperty: property];
    }
    
    property = @"border-width";
    if([style hasProperty: property]) {
        view.layer.borderWidth = [[style valueForProperty: property] floatValue];
    }
    
    property = @"border-color";
    if([style hasProperty: property]) {
        view.layer.borderColor = [[style valueForProperty: property] CGColor];
    }
    
    property = @"border-radius";
    if([style hasProperty: property]) {
        view.layer.cornerRadius = [[style valueForProperty: property] floatValue];
    }
}

@end
