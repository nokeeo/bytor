//
//  BYBytorParser.m
//  bytor
//
//  Created by Eric Lee on 8/5/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYBytorParser.h"
#import "BYStateMachine.h"
#import "BYStyle.h"
#import "BYWordToken.h"
#import "BYNumberToken.h"

typedef NS_ENUM(NSInteger, BytorState){
    InitialState,
    DeterminingVariableOrStyle,
    VariableDetermined,
    ValueOfVariableDetermined,
    StyleDetermined,
    StylePropertyFound,
    WaitingStylePropertyValue,
    StylePropertyValueFound,
};

@interface BYBytorParser()

@property (nonatomic, strong) BYStateMachine *stateMachine;

@property (nonatomic, strong) NSMutableDictionary *variables;
@property (nonatomic, strong) NSMutableDictionary *styles;

@end

@implementation BYBytorParser

-(id) init {
    self = [super init];
    if(self) {
        self.stateMachine = [[BYStateMachine alloc] init];
        self.variables = [[NSMutableDictionary alloc] init];
        self.styles = [[NSMutableDictionary alloc] init];
        
        __weak typeof(self) weakSelf = self;
        
        [self.stateMachine addTransitionWith: InitialState class: [BYWordToken class] finalState: DeterminingVariableOrStyle operation:^(NSMutableDictionary *context, BYToken *token) {
            [context removeAllObjects];
            [context setObject: token.value forKey: @"elementName"];
        }];
        
        //Variable Parsing
        [self.stateMachine addTransitionWith: DeterminingVariableOrStyle keyword: @"=" finalState: VariableDetermined operation: nil];
        
        [self.stateMachine addTransitionWith: VariableDetermined class: [BYNumberToken class] finalState: ValueOfVariableDetermined operation:^(NSMutableDictionary *context, BYToken *token) {
            [context setObject: token forKey:@"variable"];
        }];
        
        [self.stateMachine addTransitionWith: ValueOfVariableDetermined keyword: @";" finalState: InitialState operation:^(NSMutableDictionary *context, BYToken *token){
            //Commit Variable to variable dictionary.
            NSString *variableName = context[@"elementName"];
            [weakSelf.variables setObject: [context objectForKey: @"variable"] forKey: variableName];
        }];
        
        //Style Parsing
        [self.stateMachine addTransitionWith: DeterminingVariableOrStyle keyword: @"{" finalState: StyleDetermined operation:^(NSMutableDictionary *context, BYToken *token) {
            [context setObject: [[BYStyle alloc] init] forKey: @"currentStyle"];
        }];
        
        [self.stateMachine addTransitionWith: StyleDetermined class: [BYWordToken class] finalState: StylePropertyFound operation:^(NSMutableDictionary *context, BYToken *token) {
            [context setObject: token.value forKey: @"currentStyleProperty"];
        }];
        
        [self.stateMachine addTransitionWith: StylePropertyFound keyword: @":" finalState: WaitingStylePropertyValue operation:nil];
        
        [self.stateMachine addTransitionWith: WaitingStylePropertyValue class: [BYNumberToken class] finalState: StylePropertyValueFound operation:^(NSMutableDictionary *context, BYToken *token) {
            [context setObject: token forKey: @"currentStylePropertyValue"];
        }];
        
        [self.stateMachine addTransitionWith: StylePropertyValueFound keyword: @";" finalState: StyleDetermined operation:^(NSMutableDictionary * context, BYToken *token) {
            BYStyle *style = [context objectForKey: @"currentStyle"];
            
            NSString *propertyName = [context objectForKey: @"currentStyleProperty"];
            [style addStyleProperty: propertyName value: [context objectForKey: @"currentStylePropertyValue"]];
        }];
        
        [self.stateMachine addTransitionWith: StyleDetermined keyword: @"}" finalState: InitialState operation:^(NSMutableDictionary *context, BYToken *token) {
        }];
        
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
