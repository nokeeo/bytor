//
//  BYStyle.m
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStyle.h"
#import "BYStyleProperty.h"

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

-(void) addStyleProperty: (NSString *) name value: (BYToken *) valueToken {
    [self.properties setObject: valueToken forKey: name];
    NSLog(@"%@", self.properties);
}

-(void) applyStyle: (UIView *) view {
    for(NSString *key in [self.properties allKeys]) {
        Class propertyClassName = [self getClassWithPropertyName: key];
        BYToken *valueToken = [self.properties objectForKey: key];
        if(propertyClassName) {
            id<BYStyleProperty> styleProperty = [[propertyClassName alloc] init];
            [styleProperty renderPropertyWithView: view value: valueToken.objcValue];
        }
    }
}

-(BOOL) hasProperty: (NSString *) property {
    return [self.properties objectForKey: property] != nil;
}

-(id) valueForProperty:(NSString *) name {
    return [[self.properties valueForKey: name] objcValue];
}

#pragma mark - Helper functions
-(Class) getClassWithPropertyName: (NSString *) name {
    return NSClassFromString([NSString stringWithFormat: @"BYStyleProperty_%@", name]);
}

@end
