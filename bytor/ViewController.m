//
//  ViewController.m
//  bytor
//
//  Created by Eric Lee on 6/27/15.
//  Copyright (c) 2015 Eric Lee. All rights reserved.
//

#import "ViewController.h"
#import "BYTokenizer.h"
#import "BYKeywordRecognizer.h"
#import "BYWordRecognizer.h"
#import "BYNumberRecognizer.h"
#import "BYWhiteSpaceRecognizer.h"
#import "BYCommentRecognizer.h"

#import "BYTokenStream.h"
#import "BYBytorParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYTokenizer *tokenizer = [[BYTokenizer alloc] init];
    
    [tokenizer addTokenRecognizer: [[BYNumberRecognizer alloc] init]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"="]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @";"]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"{"]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"}"]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @":"]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"|"]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @","]];
    [tokenizer addTokenRecognizer: [[BYWordRecognizer alloc] init]];
    [tokenizer addTokenRecognizer: [[BYCommentRecognizer alloc] init]];
    
    [tokenizer addIgnoredTokenRecognizers: [[BYWhiteSpaceRecognizer alloc] init]];
    
    BYTokenStream *tokenStream = [tokenizer tokenize: @"variable = 10.5; /*style|parent1,parent2{key:value}*/"];
    
    BYBytorParser *parser = [[BYBytorParser alloc] init];
    [parser parse: tokenStream];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
