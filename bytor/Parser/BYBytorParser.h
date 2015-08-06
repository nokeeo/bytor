//
//  BYBytorParser.h
//  bytor
//
//  Created by Eric Lee on 8/5/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYTokenStream.h"

@interface BYBytorParser : NSObject

-(void) parse: (BYTokenStream *) tokenStream;

@end
