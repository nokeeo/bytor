//
//  BYToken.m
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYToken.h"

@implementation BYToken

#pragma mark - Initializers
-(id) initWith:(NSString *) value position: (NSInteger)startPosition {
    self = [super init];
    if(self) {
        self.startPosition = startPosition;
        self.value = value;
    }
    
    return self;
}

-(NSInteger) length {
    return self.value.length;
}

-(NSInteger) endPosition {
    return self.startPosition + self.length - 1;
}

-(NSString *) description {
    return [NSString stringWithFormat: @"BYToken with value '%@' at %li", self.value, (long)self.startPosition];
}

-(id) objcValue {
    return self.value;
}

@end
