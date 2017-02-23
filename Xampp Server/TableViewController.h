//
//  TableViewController.h
//  Xampp Server
//
//  Created by Nagam Pawan on 10/12/16.
//  Copyright © 2016 Nagam Pawan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kGetUrl @"http://192.168.1.104/json.php"
@interface TableViewController : UITableViewController
@property (strong, nonatomic) NSMutableArray *getJson;
@property (strong, nonatomic) NSArray *userId;
@property (strong, nonatomic) NSArray *userName;
@property (strong, nonatomic) NSArray *userMsg;

@end
