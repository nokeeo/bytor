//
//  BYBytorRuntime.m
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYBytorRuntime.h"

@interface BYBytorRuntime()

@property (nonatomic, strong) NSMutableDictionary *variables;
@property (nonatomic, strong) NSMutableDictionary *styles;

@end

@implementation BYBytorRuntime

-(id) init {
    self = [super init];
    if(self) {
        _variables = [[NSMutableDictionary alloc] init];
        _styles = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void) addVariable:(NSString *)name value:(BYToken *)value {
    [self.variables setObject: value forKey: name];
}

-(void) addStyle:(NSString *)name style:(BYStyle *)style {
    [self.styles setObject: style forKey: name];
}

-(void) applyStyle:(NSString *)name toView:(UIView *)view {
    BYStyle *style = [self.styles objectForKey: name];
    if(style) {
        [style applyStyle: view];
    }
}

@end
