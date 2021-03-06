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
@property (nonatomic, strong) NSMutableDictionary *transitionOperationLookUpTable;
@property (nonatomic, strong) NSMutableDictionary *transitionContext;
@property (nonatomic, strong) NSArray *finalStates;
@property NSInteger currentState;

@end

@implementation BYStateMachine

-(id) init {
    self = [super init];
    if(self) {
        _lookupTable = [[NSMutableDictionary alloc] init];
        _transitionOperationLookUpTable = [[NSMutableDictionary alloc] init];
        _transitionContext = [[NSMutableDictionary alloc] init];
        _finalStates = [NSArray array];
    }
    
    return self;
}

-(void) consumeToken:(BYToken *)token error: (NSError **) error {
    BYTransition *keywordTransition = [[BYTransition alloc] initWith: self.currentState value: token.value];
    BYTransition *classTransition = [[BYTransition alloc] initWith: self.currentState value:[[token class] description]];
    
    NSNumber *keywordFinalState = [self.lookupTable objectForKey: keywordTransition];
    NSNumber *classFinalState = [self.lookupTable objectForKey: classTransition];
    
    if(keywordFinalState) {
        self.currentState = [keywordFinalState integerValue];
        [self runOperationWith: keywordTransition token: token];
    }
    else if(classFinalState) {
        self.currentState = [classFinalState integerValue];
        [self runOperationWith: classTransition token: token];
    }
    else {
        if(error) {
            NSString *errorMessage = [NSString stringWithFormat: @"Unexpected token '%@' at Line %li:%li", token.value, token.lineNumber, token.linePos];
            *error = [NSError errorWithDomain: @"com.EricLee.bytor" code: 2112 userInfo: @{
                                                                                          NSLocalizedDescriptionKey : errorMessage
                                                                                          }];
        }
    }
}

-(void) addTransitionWith:(NSInteger) startState keyword:(NSString *) keyword finalState:(NSInteger) finalState operation:(BYTransitionOperation) operation {
    BYTransition *newTransition = [[BYTransition alloc] initWith: startState value: keyword];
    [self.lookupTable setObject: [NSNumber numberWithLong: finalState] forKey: newTransition];
    [self addOperationToTable: operation withTransition: newTransition];
}

-(void) addTransitionWith:(NSInteger) startState class: (Class) class finalState:(NSInteger) finalState operation:(BYTransitionOperation) operation{
    BYTransition *newTransition = [[BYTransition alloc] initWith: startState value: [class description]];
    [self.lookupTable setObject: [NSNumber numberWithLong: finalState] forKey: newTransition];
    [self addOperationToTable: operation withTransition: newTransition];
}

-(void) setFinalStates:(NSArray *)finalStates {
    _finalStates = finalStates;
}

-(BOOL) isInFinalState {
    NSNumber *currentState = [NSNumber numberWithInteger: self.currentState];
    return [self.finalStates indexOfObjectIdenticalTo: currentState] != NSNotFound;
}

#pragma mark - Helper Methods

-(void) addOperationToTable: (BYTransitionOperation) operation withTransition:(BYTransition *) transition {
    if(operation) {
        [self.transitionOperationLookUpTable setObject: operation forKey: transition];
    }
}

-(void) runOperationWith: (BYTransition *) transition token: (BYToken *) token {
    BYTransitionOperation operation = [self.transitionOperationLookUpTable objectForKey: transition];
    if(operation) {
        operation(self.transitionContext, token);
    }
}

@end
