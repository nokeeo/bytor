//
//  BYCommentRecognizer.m
//  bytor
//
//  Created by Eric Lee on 6/28/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYCommentRecognizer.h"
#import "BYCommentToken.h"


@implementation BYCommentRecognizer

-(BYToken *) scanNextTokenIn:(NSString *)text position:(NSInteger)position {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern: @"\\/\\*(.|\n)*\\*\\/" options: NSRegularExpressionCaseInsensitive error:nil];
    
    NSRange range = [regex rangeOfFirstMatchInString: text options: NSMatchingReportProgress range: NSMakeRange(position, text.length - position)];
    
    if(range.location == position && range.length > 0) {
        NSString *tokenValue = [text substringWithRange: range];
        return [[BYCommentToken alloc] initWith: tokenValue position: position];
    }
    
    return nil;
}

@end
