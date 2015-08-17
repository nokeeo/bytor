//
//  BYBytor.h
//  bytor
//
//  Created by Eric Lee on 8/16/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BYBytor : NSObject

+(BYBytor *) sharedInstance;

-(void) stylesFromFilePath:(NSString *) filePath;
-(void) applyStyle: (NSString *) style toView: (UIView *) view;

@end
