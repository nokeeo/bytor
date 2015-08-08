//
//  BYStyleProperty.h
//  bytor
//
//  Created by Eric Lee on 8/8/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYStyleProperty <NSObject>

-(void) renderPropertyWithView: (UIView *) view value: (id) value;

@end
