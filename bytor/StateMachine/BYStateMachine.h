//
//  BYStateMachine.h
//  bytor
//
//  Created by Eric Lee on 7/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYToken.h"

@interface BYStateMachine : NSObject

-(void) addTransitionWith:(NSInteger) startState keyword:(NSString *) keyword finalState:(NSInteger) finalState;
-(void) addTransitionWith:(NSInteger) startState class: (Class) class finalState:(NSInteger) finalState;

-(void) consumeToken: (BYToken *) token;

@end
