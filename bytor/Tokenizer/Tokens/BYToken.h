//
//  BYToken.h
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYToken : NSObject

@property NSString *value;
@property NSInteger startPosition;
@property NSInteger lineNumber;
@property NSInteger linePos;

-(id) initWith:(NSString *) value position: (NSInteger)startPosition;
-(NSInteger) length;
-(NSInteger) endPosition;

-(id) objcValue;

@end
