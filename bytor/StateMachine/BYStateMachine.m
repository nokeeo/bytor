//
//  BYStateMachine.m
//  bytor
//
//  Created by Eric Lee on 7/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStateMachine.h"
#import "BYTransition.h"

@interface BYStateMachine()

@property (nonatomic, strong) NSMutableDictionary *lookupTable;
@property NSInteger currentState;

@end

@implementation BYStateMachine

-(id) init {
    self = [super init];
    if(self) {
        _lookupTable = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void) consumeToken:(BYToken *)token {
    BYTransition *keywordTransition = [[BYTransition alloc] initWith: self.currentState value: token.value];
    BYTransition *classTransition = [[BYTransition alloc] initWith: self.currentState value:[[token class] description]];
    
    NSNumber *keywordFinalState = [self.lookupTable objectForKey: keywordTransition];
    NSNumber *classFinalState = [self.lookupTable objectForKey: classTransition];
    
    if(keywordFinalState) {
        self.currentState = [keywordFinalState integerValue];
        NSLog(@"Moved states using %@", token);
        NSLog(@"Current State: %ld", (long)[keywordFinalState integerValue]);
    }
    else if(classFinalState) {
        self.currentState = [classFinalState integerValue];
        NSLog(@"Moved states using %@", token);
        NSLog(@"Current State: %ld", (long)[classFinalState integerValue]);
    }
    else {
        NSLog(@"Transition not found for: %@", token);
    }
}

-(void) addTransitionWith:(NSInteger) startState keyword:(NSString *) keyword finalState:(NSInteger) finalState {
    BYTransition *newTransition = [[BYTransition alloc] initWith: startState value: keyword];
    [self.lookupTable setObject: [NSNumber numberWithLong: finalState] forKey: newTransition];
    NSLog(@"%@", self.lookupTable);
}

-(void) addTransitionWith:(NSInteger) startState class: (Class) class finalState:(NSInteger) finalState {
    BYTransition *newTransition = [[BYTransition alloc] initWith: startState value: [class description]];
    [self.lookupTable setObject: [NSNumber numberWithLong: finalState] forKey: newTransition];
    NSLog(@"%@", self.lookupTable);
}

@end
