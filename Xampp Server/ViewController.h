//
//  ViewController.h
//  Xampp Server
//
//  Created by Nagam Pawan on 10/12/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kPostUrl @"http://192.168.1.104/testDB1.php"
#define kName @"name"
#define kMessage @"message"
#define kId @"id"

@interface ViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>{
    NSURLConnection *postConnection;
}
@property (strong, nonatomic) IBOutlet UITextField *idTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextView *messageText;

- (IBAction)submit:(id)sender;
- (IBAction)dataBase:(id)sender;

-(void) postMessage:(NSString *)message withName:(NSString *)name withId:(NSString *) userId;
@end

