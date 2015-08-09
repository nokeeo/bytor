//
//  BYStyle.m
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStyle.h"

@interface BYStyle()

@property (nonatomic, strong) NSMutableDictionary *properties;

@end

@implementation BYStyle

-(id) init {
    self = [super init];
    if(self) {
        _properties = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void) addStyleProperty: (NSString *) name value: (NSArray *) valueTokens {
    [self.properties setObject: valueTokens forKey: name];
    NSLog(@"%@", self.properties);
}

-(BOOL) hasProperty: (NSString *) property {
    return [self.properties objectForKey: property] != nil;
}

-(id) valueForProperty:(NSString *) name {
    NSArray *collection = [self.properties objectForKey: name];
    if(collection) {
        if([collection count] > 1) {
            NSMutableArray *objcValues = [NSMutableArray array];
            for(BYToken *token in collection) {
                [objcValues addObject: [token objcValue]];
            }
            return objcValues;
        }
        else if([collection count] > 0){
            return [[collection objectAtIndex: 0] objcValue];
        }
    }
    return nil;
    //return [[self.properties valueForKey: name] objcValue];
}

#pragma mark - Helper functions
-(Class) getClassWithPropertyName: (NSString *) name {
    return NSClassFromString([NSString stringWithFormat: @"BYStyleProperty_%@", name]);
}

@end
