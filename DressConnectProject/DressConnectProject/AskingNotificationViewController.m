//
//  AskingNotificationViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "AskingNotificationViewController.h"

@interface AskingNotificationViewController ()
{
    NSString * msg;
}
@end

@implementation AskingNotificationViewController
@synthesize lbl_threePoints,view_forlabel;
- (void)viewDidLoad {
    [super viewDidLoad];
    msg = nil;
    // Do any additional setup after loading the view.
    lbl_threePoints.text = @"> The latest specials\n> Presonalized offers\n> Expiry reminders, and more";
    lbl_threePoints.font = [UIFont systemFontOfSize:15];
    lbl_threePoints.textColor = [UIColor darkGrayColor];
    view_forlabel.layer.cornerRadius  = 15;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)but_DontAllow:(id)sender {
    [self PushNotificationServiceChecking];
    if ([msg isEqualToString:@"Notification ON"]) {
        [[UIApplication sharedApplication] unregisterForRemoteNotifications];
        msg = @"Your Push Notification Service have Disabled";
    }
    else{
        msg = @"Your Push Notification Service is Already Disable";
    }
    //To go next View Controller
    HomeViewController * homeView = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:homeView animated:YES];
    
}
-(void)PushNotificationServiceChecking
{
    UIRemoteNotificationType types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    
    if (types & UIRemoteNotificationTypeAlert)
        {
            
         msg = @"Notification ON";
            
        }
    
    else{
        
        msg = @"Notification OFF";
        
        }
}
- (IBAction)but_ok:(id)sender
{
    [self PushNotificationServiceChecking];
    if ([msg isEqualToString:@"Notification OFF"]) {
      [[UIApplication sharedApplication]registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeAlert)];
        msg = @"Your Push Notification Service have Enabled";
    }
    else{
        msg = @"Your Push Notification Service is Already Enable";
    }
    
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
   NSString *  token = [[deviceToken description]stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"Device Token ---%@", token);
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"DeviceToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
//    const void *devTokenBytes = [deviceToken bytes];
//    self.registered = YES;
//    [self sendProviderDeviceToken:devTokenBytes];
}
- (void)application:(UIApplication *)app
didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    NSLog(@"Error in registration. Error: %@", err);
}
@end
