//
//  BYNumberRecognizer.m
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYNumberRecognizer.h"
#import "BYNumberToken.h"

@implementation BYNumberRecognizer

-(BYToken *) scanNextTokenIn:(NSString *)text position:(NSInteger)position {
    
    NSString *pattern = @"\\-?[0-9]*(\\.[0-9]+)?";
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern: pattern options: NSRegularExpressionCaseInsensitive error: &error];
    
    NSRange range = [regex rangeOfFirstMatchInString: text options: NSMatchingReportProgress range: NSMakeRange(position, (text.length - position))];
    
    if(range.length > 0 && position == range.location) {
        return [[BYNumberToken alloc] initWith: [text substringWithRange: range] position: position];
    }
    
    return nil;
}

@end
