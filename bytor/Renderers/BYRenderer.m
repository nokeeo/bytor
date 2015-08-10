//
//  BYRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYRenderer.h"

@implementation BYRenderer

-(void) renderView:(UIView *) view withStyle: (BYStyle *) style {
    
}

-(void) renderProperty: (NSString *) property withStyle: (BYStyle *) style withOperation: (BYRenderOperation) operation {
    if([style hasProperty: property] && ![style hasRenderedProperty: property]) {
        id value = [style valueForProperty: property];
        operation(value);
        [style setRenderedProperty: property];
    }
    else {
        //Check to see if parents have given property
        for(BYStyle *parentStyle in style.parentStyles) {
            [self renderProperty: property withStyle: parentStyle withOperation: operation];
        }
    }
}

@end
