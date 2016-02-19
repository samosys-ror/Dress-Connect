//
//  OutfitViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/18/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "friendTableViewCell.h"
#import "HomeViewController.h"
#import "EventViewController.h"
#import "SettingViewController.h"

@interface OutfitViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITabBarDelegate>
//- (IBAction)but_you:(id)sender;
- (IBAction)but_friend:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *table_friend;
@property (strong, nonatomic) IBOutlet UITabBar *tabBar;
@property (strong, nonatomic) IBOutlet UIView *view_you;
@property (strong, nonatomic) IBOutlet UIView *view_friend;
@property (strong, nonatomic) IBOutlet UIButton *but_youProp;

@end
