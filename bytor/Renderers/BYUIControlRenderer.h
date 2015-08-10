//
//  BYUIControlRenderer.h
//  bytor
//
//  Created by Eric Lee on 8/10/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUIViewRenderer.h"

@interface BYUIControlRenderer : BYUIViewRenderer

-(void) renderView:(UIControl *)view withStyle:(BYStyle *)style;

@end
