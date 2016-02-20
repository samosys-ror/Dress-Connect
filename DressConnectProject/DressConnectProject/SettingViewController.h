//
//  SettingViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/19/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "OutfitViewController.h"
#import "EventViewController.h"
#import "SettingTableViewCell.h"

@interface SettingViewController : UIViewController<UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table_setting;
@property (strong, nonatomic) IBOutlet UITabBar *tabBar;

@end
