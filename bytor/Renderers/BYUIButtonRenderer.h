//
//  BYUIButtonRenderer.h
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUIViewRenderer.h"
#import "BYUIControlRenderer.h"

@interface BYUIButtonRenderer : BYUIControlRenderer

-(void) renderView:(UIButton *)view withStyle:(BYStyle *)style;

@end
