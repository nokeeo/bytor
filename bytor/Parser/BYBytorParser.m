//
//  BYBytorParser.m
//  bytor
//
//  Created by Eric Lee on 8/5/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYBytorParser.h"
#import "BYStateMachine.h"
#import "BYWordToken.h"
#import "BYNumberToken.h"

typedef NS_ENUM(NSInteger, BytorState){
    InitialState,
    DeterminingVariableOrStyle,
    VariableDetermined,
    ValueOfVariableDetermined,
    StyleDetermined
};

@interface BYBytorParser()

@property (nonatomic, strong) BYStateMachine *stateMachine;

@end

@implementation BYBytorParser

-(id) init {
    self = [super init];
    if(self) {
        self.stateMachine = [[BYStateMachine alloc] init];
        
        [self.stateMachine addTransitionWith: InitialState class: [BYWordToken class] finalState: DeterminingVariableOrStyle];
        
        //Variable Parsing
        [self.stateMachine addTransitionWith: DeterminingVariableOrStyle keyword: @"=" finalState: VariableDetermined];
        [self.stateMachine addTransitionWith: VariableDetermined class: [BYNumberToken class] finalState: ValueOfVariableDetermined];
        [self.stateMachine addTransitionWith: ValueOfVariableDetermined keyword: @";" finalState: DeterminingVariableOrStyle];
        
        [self.stateMachine addTransitionWith: DeterminingVariableOrStyle keyword: @"{" finalState: StyleDetermined];
    }
    
    return self;
}

-(void) parse: (BYTokenStream *) tokenStream {
    while(tokenStream.hasNext) {
        BYToken *currentToken = [tokenStream nextToken];
        [self.stateMachine consumeToken: currentToken];
    }
}

@end
