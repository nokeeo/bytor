//
//  BYTokenStream.h
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ByToken.h"

@interface BYTokenStream : UITableViewController

-(void) addToken: (BYToken *) token;
-(BOOL) hasNext;
-(BYToken *) nextToken;

@end
