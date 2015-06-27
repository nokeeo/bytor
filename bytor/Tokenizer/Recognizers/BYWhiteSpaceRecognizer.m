//
//  BYWhiteSpaceRecognizer.m
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYWhiteSpaceRecognizer.h"
#import "BYWhiteSpaceToken.h"

@implementation BYWhiteSpaceRecognizer

-(BYToken *) scanNextTokenIn:(NSString *)text position:(NSInteger)position {
    NSString *whiteSpace = @"";
    NSScanner *scanner = [[NSScanner alloc] initWithString: text];
    [scanner setScanLocation: position];
    [scanner setCharactersToBeSkipped: nil];
    
    [scanner scanCharactersFromSet: [NSCharacterSet whitespaceAndNewlineCharacterSet] intoString: &whiteSpace];
    
    if(![whiteSpace isEqualToString: @""]) {
        return [[BYWhiteSpaceToken alloc] initWith: whiteSpace position: position];
    }
    
    return nil;
}

@end
