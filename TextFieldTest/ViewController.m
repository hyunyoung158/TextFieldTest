//
//  ViewController.m
//  TextFieldTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

//리턴키로 키보드감추기
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"input: %@", textField.text);
    [textField resignFirstResponder];
    return YES;
}

//입력금지 2번
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (2 == textField.tag) {
        return NO;
    }
    return YES;
}

//z키 입력불가
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (3 == textField.tag && NSOrderedSame == [string compare:@"z" options:NSCaseInsensitiveSearch]) {
        return NO;
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 205, 0, 0)];
    label.text = @"Z입력금지";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [self.view addSubview:label];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(130, 200, 171, 31)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self; //viewController
    textField.tag = 3;
    
    [self.view addSubview:textField];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
