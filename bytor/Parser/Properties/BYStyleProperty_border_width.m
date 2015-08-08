//
//  BYStyleProperty_border_width.m
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStyleProperty_border_width.h"

@implementation BYStyleProperty_border_width

-(void) renderPropertyWithView:(UIView *)view value:(id)value {
    view.layer.borderWidth = [value floatValue];
}

@end
