//
//  BYStyleProperty.h
//  bytor
//
//  Created by Eric Lee on 8/10/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYStyleProperty : NSObject

-(id) initWithName: (NSString *) name withValues: (NSArray *) values;
-(id) value;

@property BOOL isRendered;

@end
