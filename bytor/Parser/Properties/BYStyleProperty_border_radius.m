//
//  BYStyleProperty_border_radius.m
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStyleProperty_border_radius.h"

@implementation BYStyleProperty_border_radius

-(void) renderPropertyWithView:(UIView *) view value:(id) value {
    view.layer.cornerRadius = [value floatValue];
}

@end
