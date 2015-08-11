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

-(BYTokenStream *) tokenize:(NSString *)inputString error: (NSError **) errorPtr {
    BYTokenStream *tokens = [[BYTokenStream alloc] init];
    
    NSInteger currentCharPosition = 0;
    NSInteger currentLine = 1;
    
    while(currentCharPosition < inputString.length) {
        BOOL tokenFound = NO;
        
        //Check for token
        for(id<BYTokenRecognizer> recognizer in self.tokenRecognizers) {
            BYToken *token = [recognizer scanNextTokenIn: inputString position: currentCharPosition];
            
            if(token) {
                tokenFound = YES;
                [tokens addToken: token];
                token.lineNumber = currentLine = currentLine;
                token.linePos = [self linePosInString: inputString forParsePos: currentCharPosition];
                currentLine += [self numberOfLinesBetween: currentCharPosition end: currentCharPosition + token.length withString: inputString];
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
                    currentLine += [self numberOfLinesBetween: currentCharPosition end: currentCharPosition + token.length withString: inputString];
                    currentCharPosition += token.length;
                    break;
                }
            }
        }
        
        //If it is still not found print an error message
        if(!tokenFound) {
            if(errorPtr) {
                char errorChar = [inputString characterAtIndex: currentCharPosition];
                NSInteger errorLinePos = [self linePosInString: inputString forParsePos: currentCharPosition];
                NSString *errorMessage = [NSString stringWithFormat: @"Unexpected character '%c' at Line: %li:%li", errorChar, currentLine, errorLinePos];
                NSDictionary *userInfo = @{
                                            NSLocalizedDescriptionKey : errorMessage
                                         };
                *errorPtr = [NSError errorWithDomain: @"com.EricLee.bytor" code: 2112 userInfo: userInfo];
            }
            
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

#pragma mark - Helper Function
-(NSInteger) numberOfLinesBetween: (NSInteger) start end: (NSInteger) end withString: (NSString *) value {
    NSInteger numLines = 0;
    NSInteger curPos = start;
    while(curPos < end) {
        if([value characterAtIndex: curPos] == '\n') {
            numLines++;
        }
        curPos++;
    }
    return numLines;
}

-(NSInteger) linePosInString: (NSString *) value forParsePos: (NSInteger) parsePos {
    NSInteger currentPos = parsePos;
    while(currentPos > 0) {
        if([value characterAtIndex: currentPos] == '\n') {
            break;
        }
        currentPos--;
    }
    return parsePos - currentPos;
}

@end
