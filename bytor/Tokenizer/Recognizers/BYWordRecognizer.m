//
//  BYWordRecognizer.m
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYWordRecognizer.h"
#import "BYWordToken.h"

@implementation BYWordRecognizer

-(BYToken *) scanNextTokenIn:(NSString *)text position:(NSInteger)position {
    NSString *word = @"";
    NSScanner *scanner = [[NSScanner alloc] initWithString: text];
    [scanner setScanLocation: position];
    
    //Word must start with a letter.  Scan for letters first.
    NSString *buffer = @"";
    [scanner scanCharactersFromSet: [NSCharacterSet letterCharacterSet] intoString: &buffer];
    word = [NSString stringWithFormat: @"%@%@", word, buffer];
    //If the word starts with letters then scan for alphanumerics
    if(![self isStringEmpty: word]) {
        buffer = @"";
        [scanner scanCharactersFromSet: [NSCharacterSet alphanumericCharacterSet] intoString: &buffer];
        word = [NSString stringWithFormat: @"%@%@", word, buffer];
        return [[BYWordToken alloc] initWith: word position: position];
    }
    
    return nil;
}

#pragma mark - Helper Functions

-(BOOL) isStringEmpty: (NSString *) value {
    return [value isEqualToString: @""];
}

@end
