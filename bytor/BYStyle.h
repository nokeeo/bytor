//
//  BYStyle.h
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BYToken.h"

@interface BYStyle : NSObject

-(void) addStyleProperty: (NSString *) name value: (BYToken *) valueToken;
-(void) applyStyle: (UIView *) view;

-(BOOL) hasProperty: (NSString *) property;
-(id) valueForProperty: (NSString *) name;

@end
