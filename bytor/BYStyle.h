//
//  BYStyle.h
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYToken.h"

@interface BYStyle : NSObject

-(void) addStyleProperty: (NSString *) name value: (BYToken *) valueToken;

-(BOOL) hasProperty: (NSString *) property;
-(id) valueForProperty: (NSString *) name;

@end
