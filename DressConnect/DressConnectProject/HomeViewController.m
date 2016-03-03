//
//  HomeViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "HomeViewController.h"
#import <Google/Analytics.h>
@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize view_tabBar,butTabBarSelected;
- (void)viewDidLoad {
    [super viewDidLoad];
    //For tab bar View
    NSString *name = @"Home";
    [view_tabBar setBackgroundColor:[UIColor colorWithRed:33/255 green:34/255 blue:38/255 alpha:1.0]];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:name];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    // Do any additional setup after loading the view.
   
}
-(void)viewWillAppear:(BOOL)animated
{
    [butTabBarSelected setBackgroundColor:[UIColor colorWithRed:33.0/255.0 green:38.0/255.0 blue:42.0/255.0 alpha:1.0]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)button_tabBar:(id)sender
{
    if ([sender tag]==1) {
        
    }
    else if ([sender tag]==2)
    {
        EventViewController * event = [self.storyboard instantiateViewControllerWithIdentifier:@"EventViewController"];
        [self.navigationController pushViewController:event animated:NO];
    }
    else if ([sender tag]==3)
    {
        
    }
    else if ([sender tag]==4)
    {
        OutfitViewController * outfit = [self.storyboard instantiateViewControllerWithIdentifier:@"OutfitViewController"];
        [self.navigationController pushViewController:outfit animated:NO];
    }
    else if ([sender tag]==5)
    {
        SettingViewController * setting = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
        [self.navigationController pushViewController:setting animated:NO];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
