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
#import "AddFriendViewController.h"

@interface OutfitViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
//- (IBAction)but_you:(id)sender;
- (IBAction)but_friend:(id)sender;
- (IBAction)but_you:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *table_friend;
@property (strong, nonatomic) IBOutlet UIView *view_friend;
@property (strong, nonatomic) IBOutlet UIButton *but_youProp;
@property (strong, nonatomic) IBOutlet UIButton *but_friend;
@property IBOutlet UIView * view_tabBar;
@property IBOutlet UIButton * butTabBarSelected;
@property IBOutlet UIImageView * imgBack;
@property IBOutlet UIView * view_help;
-(IBAction)button_tabBar:(id)sender;
-(IBAction)but_help:(id)sender;
-(IBAction)but_cross:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *view_addFriendForYou;
@property (strong, nonatomic) IBOutlet UIButton *but_addFriendsForYou;
@property (strong, nonatomic) IBOutlet UIView *view_addFriendForFriends;
@property (strong, nonatomic) IBOutlet UIButton *but_addFriendsForFriends;
-(IBAction)button_addfriend:(id)sender;


@end
