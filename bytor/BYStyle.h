//
//  BYStyle.h
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYToken.h"
#import "BYStyleProperty.h"

@interface BYStyle : NSObject

-(void) addParentStyle: (BYStyle *) parentStyle;
-(NSArray *) parentStyles;

-(void) addStyleProperty: (NSString *) name value: (NSArray *) valueTokens;

-(BOOL) hasProperty: (NSString *) property;
-(id) valueForProperty: (NSString *) name;

-(BOOL) hasRenderedProperty: (NSString *) property;
-(void) setRenderedProperty: (NSString *) property;

@end
