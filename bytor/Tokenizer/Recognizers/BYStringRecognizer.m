//
//  BYStringRecognizer.m
//  bytor
//
//  Created by Eric Lee on 8/7/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStringRecognizer.h"
#import "BYStringToken.h"

@implementation BYStringRecognizer

-(BYToken *) scanNextTokenIn:(NSString *)text position:(NSInteger)position {
    BOOL stringInBounds = position + 1 < text.length;
    if([text characterAtIndex: position] == '"' && stringInBounds) {
        NSScanner *scanner = [[NSScanner alloc] initWithString: text];
        NSString *stringValue;
        
        [scanner setScanLocation: position + 1];
        [scanner setCharactersToBeSkipped: nil];
        
        if([scanner scanUpToString: @"\"" intoString: &stringValue]) {
            NSString *tokenValue = [NSString stringWithFormat: @"\"%@\"", stringValue];
            return [[BYStringToken alloc] initWith: tokenValue position: position];
        }
    }
    
    return nil;
}

@end
