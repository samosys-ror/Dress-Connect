//
//  HomeViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventViewController.h"
#import "OutfitViewController.h"
#import "SettingViewController.h"

@interface HomeViewController : UIViewController

@property IBOutlet UIView * view_tabBar;
-(IBAction)button_tabBar:(id)sender;
@property IBOutlet UIButton * butTabBarSelected;
@end
