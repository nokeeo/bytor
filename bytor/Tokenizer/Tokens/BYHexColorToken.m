//
//  BYHexColorToken.m
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYHexColorToken.h"

@implementation BYHexColorToken

-(id) objcValue {
    unsigned int hexint = 0;
    
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString: self.value];
    
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet
                                       characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&hexint];
    
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:1];
    
    return color;
}

@end
