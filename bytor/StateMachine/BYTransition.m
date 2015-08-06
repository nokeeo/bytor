//
//  BYTransition.m
//  bytor
//
//  Created by Eric Lee on 8/5/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYTransition.h"

@interface BYTransition()

@property NSInteger currentState;
@property NSString *transitionValue;

@end

@implementation BYTransition

-(id) initWith:(NSInteger)startState value:(NSString *) value {
    self = [super init];
    if(self) {
        self.currentState = startState;
        self.transitionValue = value;
    }
    
    return self;
}

-(NSUInteger) hash {
    return [[NSString stringWithFormat: @"%@%ld", self.transitionValue, self.currentState] hash];
}

-(BOOL) isEqual:(id)object {
    return [object hash] == [self hash];
}

-(id) copyWithZone:(NSZone *)zone {
    id copy = [[[self class] alloc] init];
    
    if(copy) {
        [copy setCurrentState: self.currentState];
        [copy setTransitionValue: self.transitionValue];
    }
    
    return copy;
}

@end
