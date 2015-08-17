//
//  UIView+BYBytorStyling.m
//  bytor
//
//  Created by Eric Lee on 8/16/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "UIView+BYBytor.h"
#import "BYBytor.h"

@implementation UIView (BYBytor)

-(void) setStyle: (NSString *) styleName {
    [[BYBytor sharedInstance] applyStyle: styleName toView: self];
}

@end
