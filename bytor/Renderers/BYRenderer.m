//
//  BYRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYRenderer.h"

@implementation BYRenderer

-(void) renderView:(UIView *) view withStyle: (BYStyle *) style {
    
}

-(void) renderProperty: (NSString *) property withStyle: (BYStyle *) style withTypeClasses: (NSArray *) types withOperation: (BYRenderOperation) operation {
    if([style hasProperty: property] && ![style hasRenderedProperty: property]) {
        //Check to see if value is the right type
        id value = [style valueForProperty: property];
        if([self isRightType: value types: types]) {
            operation(value);
            [style setRenderedProperty: property];
        }
        else {
            NSString *typeString = [self getTypeErrorStringWithTypes: types];
            NSString *foundType = [self getTypeErrorStringWithTypes: @[value]];
            NSInteger lineNumber = [style lineNumberForProperty: property];
            NSString *errorMessage = [NSString stringWithFormat: @"WARNING: Unexpected type %@ for property %@ on Line %li. Expected %@", foundType, property, lineNumber, typeString];
            NSLog(@"%@", errorMessage);
        }
    }
    else {
        //Check to see if parents have given property
        for(BYStyle *parentStyle in style.parentStyles) {
            [self renderProperty: property withStyle: parentStyle withTypeClasses: types withOperation: operation];
        }
    }
}

#pragma mark - Helper Functions

-(BOOL) isRightType: (id) value types: (NSArray *) types {
    for(id type in types) {
        if([type isKindOfClass: [NSArray class]]) {
            return [self does: value matchCollectionTypes: type];
        }
        else if([value isKindOfClass: type]) {
            return YES;
        }
    }
    return NO;
}

-(BOOL) does: (id) object matchCollectionTypes: (NSArray *) collection {
    if([object isKindOfClass: [NSArray class]] && [collection count] == [object count]) {
        BOOL matches = YES;
        for(int i = 0; i < [object count]; i++) {
            id valueObject = [object objectAtIndex: i];
            id collectionObject = [collection objectAtIndex: i];
            if(![valueObject isKindOfClass: collectionObject]) {
                matches = NO;
                break;
            }
        }
        return matches;
    }
    return NO;
}

-(NSString *) getTypeErrorStringWithTypes: (NSArray *) types {
    NSMutableString *errorString = [NSMutableString stringWithString: @""];
    
    for(int i = 0; i < [types count]; i++) {
        id type = [types objectAtIndex: i];
        if([type isKindOfClass: [NSArray class]]) {
            [errorString appendFormat: @"[%@]", [self getTypeErrorStringWithTypes: type]];
        }
        else {
            if(i > 0) {
                [errorString appendString: @","];
            }
            [errorString appendFormat: @"%@", type];
        }
    }
    
    return errorString;
}

@end
