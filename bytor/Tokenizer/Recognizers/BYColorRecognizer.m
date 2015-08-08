//
//  BYColorRecognizer.m
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYColorRecognizer.h"
#import "BYHexColorToken.h"

@implementation BYColorRecognizer

-(BYToken *) scanNextTokenIn:(NSString *)text position:(NSInteger)position {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern: @"#[0-9a-fA-F]{6}" options: NSRegularExpressionCaseInsensitive error: nil];
    
    NSRange range = [regex rangeOfFirstMatchInString: text options: NSMatchingReportProgress range: NSMakeRange(position, text.length - position)];
    
    if(range.location == position && range.length > 0) {
        NSString *tokenValue = [text substringWithRange: range];
        return [[BYHexColorToken alloc] initWith: tokenValue position: position];
    }
    
    return nil;
}

@end
