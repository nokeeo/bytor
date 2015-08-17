//
//  BYBytor.m
//  bytor
//
//  Created by Eric Lee on 8/16/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "BYBytor.h"
#import "BYTokenizer.h"

#import "BYKeywordRecognizer.h"
#import "BYWordRecognizer.h"
#import "BYNumberRecognizer.h"
#import "BYWhiteSpaceRecognizer.h"
#import "BYCommentRecognizer.h"
#import "BYStringRecognizer.h"
#import "BYColorRecognizer.h"

#import "BYBytorParser.h"

@interface BYBytor()

@property (nonatomic, strong) BYTokenizer *tokenizer;
@property (nonatomic, strong) BYBytorRuntime *runtime;

@end

@implementation BYBytor

+(BYBytor *) sharedInstance {
    static BYBytor *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[BYBytor alloc] init];
    });
    return _sharedInstance;
}

-(id) init {
    self = [super init];
    if(self) {
        _tokenizer = [[BYTokenizer alloc] init];
        [_tokenizer addTokenRecognizer: [[BYNumberRecognizer alloc] init]];
        [_tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"="]];
        [_tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @";"]];
        [_tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"{"]];
        [_tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"}"]];
        [_tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @":"]];
        [_tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"|"]];
        [_tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @","]];
        [_tokenizer addTokenRecognizer: [[BYWordRecognizer alloc] init]];
        [_tokenizer addTokenRecognizer: [[BYStringRecognizer alloc] init]];
        [_tokenizer addTokenRecognizer: [[BYColorRecognizer alloc] init]];
        
        [_tokenizer addIgnoredTokenRecognizers: [[BYCommentRecognizer alloc] init]];
        [_tokenizer addIgnoredTokenRecognizers: [[BYWhiteSpaceRecognizer alloc] init]];
    }
    
    return self;
}

-(void) stylesFromFilePath:(NSString *) filePath {
    NSError *error;
    NSString *code = [NSString stringWithContentsOfFile: filePath encoding: NSUTF8StringEncoding error: &error];
    
    if(error) {
        NSLog(@"ERROR: %@", error);
    }
    
    NSError *tokenizeError;
    BYTokenStream *tokenStream = [_tokenizer tokenize: code error: &tokenizeError];
    if(tokenizeError) {
        NSLog(@"ERROR: %@", tokenizeError.localizedDescription);
    }
    
    BYBytorParser *parser = [[BYBytorParser alloc] init];
    
    NSError *parseError;
    _runtime = [parser parse: tokenStream error: &parseError];
    if(parseError) {
        NSLog(@"ERROR: %@", parseError.localizedDescription);
    }
}

-(void) applyStyle:(NSString *)style toView:(id)view {
    [_runtime applyStyle: style toView: view];
}

@end
