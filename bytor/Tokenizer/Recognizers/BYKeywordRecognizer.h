//
//  BYKeywordRecognizer.h
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYToken.h"
#import "BYTokenRecognizer.h"

@interface BYKeywordRecognizer : BYToken <BYTokenRecognizer>

-(id) initWith: (NSString *) keyword;

@end
