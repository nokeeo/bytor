
//
//  BYStyleProperty_background_color.m
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStyleProperty_background_color.h"

@implementation BYStyleProperty_background_color

-(void) renderPropertyWithView:(UIView *)view value:(id)value {
    view.backgroundColor = value;
}

@end
