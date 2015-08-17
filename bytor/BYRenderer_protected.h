//
//  BYRenderer_protected.h
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYRenderer.h"

@interface BYRenderer()

-(void) renderProperty: (NSString *) property withStyle: (BYStyle *) style withOperation: (BYRenderOperation) operation;
-(void) renderProperty: (NSString *) property withStyle: (BYStyle *) style withTypeClasses: (NSArray *) types withOperation: (BYRenderOperation) operation;

@end

