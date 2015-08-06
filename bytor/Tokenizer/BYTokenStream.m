//
//  BYTokenStream.m
//  bytor
//
//  Created by Eric Lee on 8/6/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYTokenStream.h"

@interface BYTokenStream()

@property (nonatomic, strong) NSMutableArray *tokens;
@property int currentPosition;

@end

@implementation BYTokenStream

-(id) init {
    self = [super init];
    if(self) {
        self.tokens = [[NSMutableArray alloc] init];
        self.currentPosition = 0;
    }
    
    return self;
}

-(void) addToken:(BYToken *)token {
    [self.tokens addObject: token];
}

-(BOOL) hasNext {
    return self.currentPosition < [self.tokens count];
}

-(BYToken *) nextToken {
    BYToken *currentToken = [self.tokens objectAtIndex: self.currentPosition];
    self.currentPosition = self.currentPosition + 1;
    return currentToken;
}

-(NSString *) description {
    NSMutableString *desc = [[NSMutableString alloc] initWithString: @""];
    
    for(BYToken *token in self.tokens) {
        [desc appendFormat: @"%@\n", token];
    }
        
    return desc;
}

@end
