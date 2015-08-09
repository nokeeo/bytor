//
//  BYStringToken.m
//  bytor
//
//  Created by Eric Lee on 8/7/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStringToken.h"

@implementation BYStringToken

-(id) objcValue {
    return [self.value stringByReplacingOccurrencesOfString: @"\"" withString: @""];
}

@end
