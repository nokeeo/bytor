//
//  BYBytorRuntime.h
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BYToken.h"
#import "BYStyle.h"

@interface BYBytorRuntime : NSObject

-(void) addVariable: (NSString *) name value: (BYToken *) value;
-(BYToken *) getTokenValueForVariable: (NSString *) variableName;

-(BOOL) isStyleDefined: (NSString *) styleName;
-(BYStyle *) styleForName: (NSString *) styleName;

-(void) addStyle: (NSString *) name style: (BYStyle *) style;
-(void) applyStyle: (NSString *) name toView: (UIView *) view;

@end
