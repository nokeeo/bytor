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
#import "BYStringRecognizer.h"
#import "BYColorRecognizer.h"

#import "BYTokenStream.h"
#import "BYBytorParser.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UITextField *testTextField;

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
    [tokenizer addTokenRecognizer: [[BYStringRecognizer alloc] init]];
    [tokenizer addTokenRecognizer: [[BYColorRecognizer alloc] init]];
    [tokenizer addTokenRecognizer: [[BYCommentRecognizer alloc] init]];
    
    [tokenizer addIgnoredTokenRecognizers: [[BYWhiteSpaceRecognizer alloc] init]];
    
    NSString *bytorFilePath = [[NSBundle mainBundle] pathForResource: @"example" ofType: @".bytor"];
    NSString *bytorCode = [NSString stringWithContentsOfFile: bytorFilePath encoding: NSUTF8StringEncoding error: nil];
    
    BYTokenStream *tokenStream = [tokenizer tokenize: bytorCode];
    
    BYBytorParser *parser = [[BYBytorParser alloc] init];
    BYBytorRuntime *runtime = [parser parse: tokenStream];
    [runtime applyStyle: @"subStyle" toView: self.testView];
    [runtime applyStyle: @"testLabel" toView: self.testLabel];
    [runtime applyStyle: @"testButton" toView: self.testButton];
    [runtime applyStyle: @"testTextField" toView: self.testTextField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
