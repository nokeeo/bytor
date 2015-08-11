//
//  BYStateMachine.h
//  bytor
//
//  Created by Eric Lee on 7/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYToken.h"

typedef void (^BYTransitionOperation)(NSMutableDictionary*, BYToken*);

@interface BYStateMachine : NSObject

-(void) addTransitionWith:(NSInteger) startState keyword:(NSString *) keyword finalState:(NSInteger) finalState operation: (BYTransitionOperation) TransitionOperation;
-(void) addTransitionWith:(NSInteger) startState class: (Class) class finalState:(NSInteger) finalState operation: (BYTransitionOperation) TransitionOperation;

-(void) consumeToken:(BYToken *)token error: (NSError **) error;

-(void) setFinalStates: (NSArray *) finalStates;
-(BOOL) isInFinalState;

@end
