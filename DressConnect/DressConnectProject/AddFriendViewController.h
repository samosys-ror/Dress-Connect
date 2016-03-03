//
//  AddFriendViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/29/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "EventViewController.h"
#import "OutfitViewController.h"
#import "SettingViewController.h"
#import "AddFriendTableViewCell.h"

@interface AddFriendViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)but_back:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *table_addFriend;
@property (strong, nonatomic) IBOutlet UIView *viewFortabBar;
- (IBAction)but_tab:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lbl_name;
@property IBOutlet UIButton * butTabBarSelected;
@end
