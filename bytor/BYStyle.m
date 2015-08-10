//
//  BYStyle.m
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYStyle.h"

@interface BYStyle()

@property (nonatomic, strong) NSMutableArray *parentStyles;
@property (nonatomic, strong) NSMutableDictionary *properties;

@end

@implementation BYStyle

-(id) init {
    self = [super init];
    if(self) {
        _properties = [[NSMutableDictionary alloc] init];
        _parentStyles = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void) addParentStyle:(BYStyle *)parentStyle {
    //Pushes the parent style on the the parent stack
    [_parentStyles insertObject: parentStyle atIndex: 0];
}

-(NSArray *) parentStyles {
    return _parentStyles;
}

-(void) addStyleProperty: (NSString *) name value: (NSArray *) valueTokens {
    BYStyleProperty *newProperty = [[BYStyleProperty alloc] initWithName: name withValues: valueTokens];
    [self.properties setObject: newProperty forKey: name];
}

-(BOOL) hasProperty: (NSString *) property {
    return [self.properties objectForKey: property] != nil;
}

-(id) valueForProperty:(NSString *) name {
    return [[self.properties objectForKey: name] value];
}

-(BOOL) hasRenderedProperty:(NSString *)property {
    if([self hasProperty: property]) {
        BYStyleProperty *styleProperty = [self.properties objectForKey: property];
        return [styleProperty isRendered];
    }
    return NO;
}

-(void) setRenderedProperty:(NSString *)property {
    if([self hasProperty: property]) {
        BYStyleProperty *styleProperty = [self.properties objectForKey: property];
        styleProperty.isRendered = YES;
    }
}

@end
