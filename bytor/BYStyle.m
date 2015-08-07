//
//  BYStyle.m
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStyle.h"

@interface BYStyle()

@property (nonatomic, strong) NSMutableDictionary *styles;

@end

@implementation BYStyle

-(id) init {
    self = [super init];
    if(self) {
        _styles = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void) addStyleProperty: (NSString *) name value: (BYToken *) valueToken {
    [self.styles setObject: valueToken forKey: name];
}

@end
