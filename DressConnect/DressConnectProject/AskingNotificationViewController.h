//
//  AskingNotificationViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface AskingNotificationViewController : UIViewController<UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIButton * but_notification;
- (IBAction)but_DontAllow:(id)sender;
- (IBAction)but_ok:(id)sender;

@end
