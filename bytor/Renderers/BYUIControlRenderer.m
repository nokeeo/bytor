//
//  BYUIControlRenderer.m
//  bytor
//
//  Created by Eric Lee on 8/10/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYUIControlRenderer.h"
#import "BYRendererUtility.h"

@implementation BYUIControlRenderer

-(void) renderView:(UIControl *)view withStyle:(BYStyle *)style {
    [self renderProperty: @"horizontal-align" withStyle: style withOperation:^(id value) {
        view.contentHorizontalAlignment = [BYRendererUtility horizontalAlignmentForString: value];
    }];
    
    [self renderProperty: @"vertical-align" withStyle: style withOperation:^(id value) {
        view.contentVerticalAlignment = [BYRendererUtility verticalAlignmentForString: value];
    }];
    
    [super renderView: view withStyle: style];
}

@end
