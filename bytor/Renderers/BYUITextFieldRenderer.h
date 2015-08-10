//
//  BYUITextFieldRenderer.h
//  bytor
//
//  Created by Eric Lee on 8/10/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUIControlRenderer.h"

@interface BYUITextFieldRenderer : BYUIControlRenderer

-(void) renderView:(UITextField *)view withStyle:(BYStyle *)style;

@end
