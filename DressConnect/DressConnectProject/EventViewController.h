//
//  EventViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "DescriptionTableViewCell.h"
#import "CreateEventViewController.h"
#import "OutfitViewController.h"
#import "SettingViewController.h"

@interface EventViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *table_viewTitle;
- (IBAction)but_create:(id)sender;
- (IBAction)but_upcoming:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *button_upcoming;
@property (strong, nonatomic) IBOutlet UITableView *table_description;
@property IBOutlet UIView * view_shedow;
@property IBOutlet UIImageView * img_scrolldown;
@property IBOutlet UIView * view_tabBar;
-(IBAction)button_tabBar:(id)sender;
@property IBOutlet UIButton * butTabBarSelected;

@end
