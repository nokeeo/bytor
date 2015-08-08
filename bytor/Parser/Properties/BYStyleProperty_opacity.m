//
//  BYStyleProperty_opacity.m
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStyleProperty_opacity.h"

@implementation BYStyleProperty_opacity

-(void) renderPropertyWithView:(UIView *)view value:(id)value {
    view.alpha = [value floatValue]; 
}

@end
