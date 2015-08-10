//
//  BYRenderer.h
//  bytor
//
//  Created by Eric Lee on 8/9/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYStyle.h"

typedef void (^BYRenderOperation)(id value);

@interface BYRenderer : NSObject

-(void) renderView:(UIView *) view withStyle: (BYStyle *) style;

@end
