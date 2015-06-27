//
//  BYKeywordRecognizer.m
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYKeywordRecognizer.h"
#import "BYKeywordToken.h"

@interface BYKeywordRecognizer()

@property (nonatomic, strong) NSString *keyword;

@end

@implementation BYKeywordRecognizer

#pragma mark - Initializers
-(id) initWith:(NSString *)keyword {
    self = [super init];
    if(self) {
        _keyword = keyword;
    }
    
    return self;
}

#pragma mark - TokenRecognizer
-(BYToken *) scanNextTokenIn:(NSString *)text position:(NSInteger)position {
    NSInteger remainingChars = text.length - position;
    
    //Make sure position is not out of bounds and there are enough chars for the keyword to exist
    if(text.length > position && remainingChars >= self.keyword.length) {
        BOOL success = YES;
        for(int i = 0; i < self.keyword.length; i++) {
            char keywordChar = [self.keyword characterAtIndex: i];
            char textChar = [text characterAtIndex: position + i];
            
            if(keywordChar != textChar) {
                success = NO;
                break;
            }
        }
        
        //If the keyword was successfully found return the token
        if(success) {
            return [[BYKeywordToken alloc] initWith: self.keyword position: position];
        }
    }
    return nil;
}

@end
