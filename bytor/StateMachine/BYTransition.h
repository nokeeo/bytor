//
//  BYTransition.h
//  bytor
//
//  Created by Eric Lee on 8/5/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BYToken.h"

@interface BYTransition : NSObject <NSCopying>

-(id) initWith: (NSInteger)startState value: (NSString *) value;

@end
