//
//  BYBytorRuntime.h
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYToken.h"
#import "BYStyle.h"

@interface BYBytorRuntime : NSObject

-(void) addVariable: (NSString *) name value: (BYToken *) value;
-(void) addStyle: (NSString *) name style: (BYStyle *) style;

@end
