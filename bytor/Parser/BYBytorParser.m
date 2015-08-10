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
#import "BYStringToken.h"
#import "BYHexColorToken.h"

typedef NS_ENUM(NSInteger, BytorState){
    InitialState,
    DeterminingVariableOrStyle,
    VariableDetermined,
    ValueOfVariableDetermined,
    StyleDetermined,
    WaitingForSuperStyle,
    SuperStyleFound,
    StylePropertyFound,
    WaitingStylePropertyValue,
    StylePropertyValueFound,
};

@interface BYBytorParser()

@property (nonatomic, strong) BYStateMachine *stateMachine;
@property (nonatomic, strong) BYBytorRuntime *bytorRuntime;

@end

@implementation BYBytorParser

-(id) init {
    self = [super init];
    if(self) {
        self.stateMachine = [[BYStateMachine alloc] init];
        self.bytorRuntime = [[BYBytorRuntime alloc] init];
        
        [self.stateMachine setFinalStates: @[[NSNumber numberWithInteger: InitialState]]];
        
        __weak typeof(self) weakSelf = self;
        
        [self.stateMachine addTransitionWith: InitialState class: [BYWordToken class] finalState: DeterminingVariableOrStyle operation:^(NSMutableDictionary *context, BYToken *token) {
            [context removeAllObjects];
            [context setObject: token.value forKey: @"elementName"];
        }];
        
        //Variable Parsing
        [self.stateMachine addTransitionWith: DeterminingVariableOrStyle keyword: @"=" finalState: VariableDetermined operation: nil];
        
        BYTransitionOperation variableValueOperation = ^(NSMutableDictionary *context, BYToken *token) {
            [context setObject: token forKey:@"variable"];
        };

        [self addValueParsingTransitionsWith: VariableDetermined endState: ValueOfVariableDetermined operation: variableValueOperation];
        
        
        [self.stateMachine addTransitionWith: ValueOfVariableDetermined keyword: @";" finalState: InitialState operation:^(NSMutableDictionary *context, BYToken *token){
            //Commit Variable to variable dictionary.
            NSString *variableName = context[@"elementName"];
            [weakSelf.bytorRuntime addVariable: variableName value: [context objectForKey: @"variable"]];
        }];
        
        //Style Parsing
        
        BYTransitionOperation styleDeterminedOperation = ^(NSMutableDictionary *context, BYToken *token) {
            [context setObject: [[BYStyle alloc] init] forKey: @"currentStyle"];
        };
        
        [self.stateMachine addTransitionWith: DeterminingVariableOrStyle keyword: @"|" finalState: WaitingForSuperStyle operation: styleDeterminedOperation];
        [self.stateMachine addTransitionWith: WaitingForSuperStyle class: [BYWordToken class] finalState: SuperStyleFound operation:^(NSMutableDictionary *context, BYToken *token) {
            if([weakSelf.bytorRuntime isStyleDefined: token.value]) {
                BYStyle *parentStyle = [weakSelf.bytorRuntime styleForName: token.value];
                BYStyle *currentStyle = [context objectForKey: @"currentStyle"];
                [currentStyle addParentStyle: parentStyle];
            }
        }];
        [self.stateMachine addTransitionWith: SuperStyleFound keyword: @"," finalState: WaitingForSuperStyle operation: nil];
        
        [self.stateMachine addTransitionWith: SuperStyleFound keyword: @"{" finalState: StyleDetermined operation: nil];
        
        [self.stateMachine addTransitionWith: DeterminingVariableOrStyle keyword: @"{" finalState: StyleDetermined operation: styleDeterminedOperation];
        
        [self.stateMachine addTransitionWith: StyleDetermined class: [BYWordToken class] finalState: StylePropertyFound operation:^(NSMutableDictionary *context, BYToken *token) {
            [context removeObjectForKey: @"currentStylePropertyValue"];
            [context setObject: token.value forKey: @"currentStyleProperty"];
        }];
        
        [self.stateMachine addTransitionWith: StylePropertyFound keyword: @":" finalState: WaitingStylePropertyValue operation:nil];
        
        BYTransitionOperation stylePropertyValueOperation = ^(NSMutableDictionary *context, BYToken *token) {
            NSMutableArray *collectionValues = [context objectForKey: @"currentStylePropertyValue"];
            if(!collectionValues) {
                collectionValues = [NSMutableArray array];
            }
            
            [collectionValues addObject: token];
            [context setObject: collectionValues forKey: @"currentStylePropertyValue"];
        };
        
        [self addValueParsingTransitionsWith: WaitingStylePropertyValue endState: StylePropertyValueFound operation: stylePropertyValueOperation];
        [self addValueParsingTransitionsWith: StylePropertyValueFound endState: StylePropertyValueFound operation: stylePropertyValueOperation];
        
        [self.stateMachine addTransitionWith: StylePropertyValueFound keyword: @";" finalState: StyleDetermined operation:^(NSMutableDictionary * context, BYToken *token) {
            BYStyle *style = [context objectForKey: @"currentStyle"];
            
            NSString *propertyName = [context objectForKey: @"currentStyleProperty"];
            [style addStyleProperty: propertyName value: [context objectForKey: @"currentStylePropertyValue"]];
        }];
        
        [self.stateMachine addTransitionWith: StyleDetermined keyword: @"}" finalState: InitialState operation:^(NSMutableDictionary *context, BYToken *token) {
            BYStyle *style = [context objectForKey: @"currentStyle"];
            NSString *styleName = [context objectForKey: @"elementName"];
            [weakSelf.bytorRuntime addStyle: styleName style: style];
        }];
        
    }
    
    return self;
}

-(BYBytorRuntime *) parse: (BYTokenStream *) tokenStream {
    while(tokenStream.hasNext) {
        BYToken *currentToken = [tokenStream nextToken];
        [self.stateMachine consumeToken: currentToken];
    }
    
    if([self.stateMachine isInFinalState]) {
        return self.bytorRuntime;
    }
    
    return nil;
}

#pragma mark - Helper Functions
-(void) addValueParsingTransitionsWith:(NSInteger) start endState: (NSInteger) end operation: (BYTransitionOperation) operation {
    [self.stateMachine addTransitionWith: start class: [BYNumberToken class] finalState: end operation: operation];
    [self.stateMachine addTransitionWith: start class: [BYStringToken class] finalState: end operation: operation];
    [self.stateMachine addTransitionWith: start class: [BYHexColorToken class] finalState: end operation: operation];
    
    //If the value is a variable
    __weak typeof(self) weakSelf = self;
    [self.stateMachine addTransitionWith: start class: [BYWordToken class] finalState: end operation:^(NSMutableDictionary *context, BYToken *token) {
        BYToken *variableValue = [weakSelf.bytorRuntime getTokenValueForVariable: token.value];
        if(variableValue) {
            operation(context, variableValue);
        }
    }];
}

@end
