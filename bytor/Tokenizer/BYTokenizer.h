//
//  BTTokenizer.h
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYTokenRecognizer.h"
#import "BYTokenStream.h"

@interface BYTokenizer : NSObject

-(BYTokenStream *) tokenize: (NSString *) inputString error: (NSError **) errorPtr;
-(void) addTokenRecognizer: (id<BYTokenRecognizer>) recognizer;
-(void) addIgnoredTokenRecognizers: (id<BYTokenRecognizer>) recognizer;

@end
