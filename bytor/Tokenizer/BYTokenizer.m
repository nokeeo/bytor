//
//  BTTokenizer.m
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYTokenizer.h"
#import "BYToken.h"

@interface BYTokenizer()

@property (nonatomic, strong) NSMutableArray *tokenRecognizers;
@property (nonatomic, strong) NSMutableArray *ignoredTokenRecognizers;

@end

@implementation BYTokenizer

-(id) init {
    self = [super init];
    if (self) {
        _tokenRecognizers = [NSMutableArray array];
        _ignoredTokenRecognizers = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Public methods

-(BYTokenStream *) tokenize:(NSString *)inputString {
    BYTokenStream *tokens = [[BYTokenStream alloc] init];
    
    NSInteger currentCharPosition = 0;
    
    while(currentCharPosition < inputString.length) {
        BOOL tokenFound = NO;
        
        //Check for token
        for(id<BYTokenRecognizer> recognizer in self.tokenRecognizers) {
            BYToken *token = [recognizer scanNextTokenIn: inputString position: currentCharPosition];
            
            if(token) {
                tokenFound = YES;
                [tokens addToken: token];
                currentCharPosition += token.length;
                
                break;
            }
        }
        
        //If we have not found the token see if we can find an ignored token
        if(!tokenFound) {
            for(id<BYTokenRecognizer> ignoreRecognizer in self.ignoredTokenRecognizers) {
                BYToken *token = [ignoreRecognizer scanNextTokenIn: inputString position: currentCharPosition];
                if(token) {
                    tokenFound = YES;
                    currentCharPosition += token.length;
                    break;
                }
            }
        }
        
        //If it is still not found print an error message
        if(!tokenFound) {
            char errorChar = [inputString characterAtIndex: currentCharPosition];
            NSString *errorMessage = [NSString stringWithFormat: @"Unexpected character '%c' at %li", errorChar, currentCharPosition];
            NSLog(@"%@", errorMessage);
            break;
        }
    }
    
    return tokens;
}

-(void) addTokenRecognizer:(id<BYTokenRecognizer>)recognizer {
    [self.tokenRecognizers addObject: recognizer];
}

-(void) addIgnoredTokenRecognizers:(id<BYTokenRecognizer>)recognizer {
    [self.ignoredTokenRecognizers addObject: recognizer];
}

@end
