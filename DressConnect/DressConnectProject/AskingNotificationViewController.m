//
//  AskingNotificationViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//
#import "AskingNotificationViewController.h"

@interface AskingNotificationViewController ()
@end

@implementation AskingNotificationViewController
@synthesize but_notification;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    but_notification.layer.cornerRadius  = 15;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)but_DontAllow:(id)sender
{
    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    HomeViewController * homeView = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:homeView animated:YES];
    //[[[UIAlertView alloc]initWithTitle:@"" message:@"Your Push Notification service has Disbled" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]show];
}

-(IBAction)but_ok:(id)sender
{
    //-- Set Notification
    if ([[UIApplication sharedApplication]respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        // For iOS 8 and above
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        // For iOS < 8
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    HomeViewController * homeView = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:homeView animated:YES];
}
@end
