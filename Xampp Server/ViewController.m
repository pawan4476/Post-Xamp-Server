//
//  ViewController.m
//  Xampp Server
//
//  Created by Nagam Pawan on 10/12/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.nameTextField.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submit:(id)sender {
    [self postMessage:self.messageText.text withName:self.nameTextField.text withId:self.idTextField.text];
    [self.messageText resignFirstResponder];
    self.nameTextField.text = nil;
    self.idTextField.text = nil;
    self.messageText.text = nil;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"test1" object:self];
}

-(void)postMessage:(NSString *)message withName:(NSString *)name withId:(NSString *)userId{
    if (name != nil && message != nil && userId != nil) {
        NSMutableString *postString = [NSMutableString stringWithString:kPostUrl];
        [postString appendString:[NSString stringWithFormat:@"?%@=%@", kName, name]];
        [postString appendString:[NSString stringWithFormat:@"&%@=%@", kMessage, message]];
        [postString appendString:[NSString stringWithFormat:@"&%@=%d", kId, userId.intValue]];
        [postString setString:[postString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:postString]];
        [request setHTTPMethod:@"POST"];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
        }];
        [dataTask resume];
    }
}
- (IBAction)dataBase:(id)sender {
    [self performSegueWithIdentifier:@"database" sender:self];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    textField.delegate = self;
    [textField resignFirstResponder];
    return textField;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        
    }
    return NO;
}
@end
