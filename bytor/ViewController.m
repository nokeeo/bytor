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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BYTokenizer *tokenizer = [[BYTokenizer alloc] init];
    
    [tokenizer addTokenRecognizer: [[BYNumberRecognizer alloc] init]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @"="]];
    [tokenizer addTokenRecognizer: [[BYKeywordRecognizer alloc] initWith: @";"]];
    [tokenizer addTokenRecognizer: [[BYWordRecognizer alloc] init]];
    
    [tokenizer addIgnoredTokenRecognizers: [[BYWhiteSpaceRecognizer alloc] init]];
    
    [tokenizer tokenize: @"hello = 10.59999;"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
