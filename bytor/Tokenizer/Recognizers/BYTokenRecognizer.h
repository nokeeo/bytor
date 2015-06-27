//
//  TokenRecognizer.h
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYToken.h"

@protocol BYTokenRecognizer <NSObject>

/**
 * Attempts to scan a token of the recognizer type at the given position in the text.
 * @return The scanned token. If it is not possible to scan a token of the recognizer's
 * type nil should be returned.
 */
-(BYToken *) scanNextTokenIn: (NSString *) text position:(NSInteger) position;

@end
