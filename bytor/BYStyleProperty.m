//
//  BYStyleProperty.m
//  bytor
//
//  Created by Eric Lee on 8/10/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYToken.h"
#import "BYStyleProperty.h"

@interface BYStyleProperty()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *styleValues;

@end

@implementation BYStyleProperty

-(id) initWithName:(NSString *)name withValues:(NSArray *)values {
    self = [super init];
    if(self) {
        _name = name;
        _styleValues = values;
        _isRendered = NO;
    }
    
    return self;
}

-(id) value {
    if([self.styleValues count] > 1) {
        NSMutableArray *objcValues = [NSMutableArray array];
        for(BYToken *token in self.styleValues) {
            [objcValues addObject: [token objcValue]];
        }
        return objcValues;
    }
    else if([self.styleValues count] > 0) {
        return [[self.styleValues objectAtIndex: 0] objcValue];
    }
    return nil;
}

-(NSInteger) lineNumber {
    if([self.styleValues count] > 0) {
        BYToken *token = [self.styleValues firstObject];
        return token.lineNumber;
    }
    
    return -1;
}

@end
