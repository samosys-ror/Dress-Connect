//
//  OutfitViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/18/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "OutfitViewController.h"

@interface OutfitViewController ()
{
    UIRefreshControl * refreshControl;

}
@end

@implementation OutfitViewController
@synthesize view_friend,table_friend,view_tabBar,but_youProp,but_friend,butTabBarSelected,imgBack,view_help,view_addFriendForYou,but_addFriendsForYou,view_addFriendForFriends,but_addFriendsForFriends;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    view_friend.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //For tab bar View
    [view_tabBar setBackgroundColor:[UIColor colorWithRed:33/255 green:34/255 blue:38/255 alpha:1.0]];
    [but_youProp addTarget:self action:@selector(but_youPropTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self but_youPropTapped:self];
    //For Help View
    view_help.layer.cornerRadius = 15;
    view_help.clipsToBounds = YES;
    //Instance Refresh Control Type
    refreshControl = [[UIRefreshControl alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-refreshControl.frame.size.width/2, 70, refreshControl.frame.size.width, refreshControl.frame.size.height)];
    
    [refreshControl addTarget:self action:@selector(getTrackData) forControlEvents:UIControlEventValueChanged];
    
    [table_friend addSubview:refreshControl];
    but_addFriendsForYou.layer.cornerRadius = 15.0;
    but_addFriendsForFriends.layer.cornerRadius = 15.0;
    //For animation view
    [view_friend setBackgroundColor:[UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1]];
    
}
-(void)getTrackData
{
    [table_friend reloadData];
    [refreshControl endRefreshing];
}
-(void)but_youPropTapped:sender
{
    [but_youProp setTitleColor:[UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1] forState:UIControlStateNormal];
    [but_friend setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        table_friend.hidden =YES;
    view_addFriendForYou.hidden = NO;
    view_addFriendForFriends.hidden = YES;
    
}
- (IBAction)but_you:(id)sender
{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frm = view_friend.frame;
        frm.origin.x = 0;
        view_friend.frame = frm;
    }];
    [self but_youPropTapped:self];
}
-(void)viewWillAppear:(BOOL)animated
{
    table_friend.hidden = YES;
    [butTabBarSelected setBackgroundColor:[UIColor colorWithRed:33.0/255.0 green:38.0/255.0 blue:42.0/255.0 alpha:1.0]];
    imgBack.hidden = YES;
    view_help.hidden = YES;
    view_addFriendForFriends.hidden= YES;
    CGRect frm = view_friend.frame;
    frm.origin.x  =0;
    view_friend.frame  =frm;
    [self but_you:self];
}
-(IBAction)button_tabBar:(id)sender
{
    if ([sender tag]==1) {
        HomeViewController * homeview = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:homeview animated:NO];
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
       
    }
    else if ([sender tag]==5)
    {
        SettingViewController * setting = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingViewController"];
        [self.navigationController pushViewController:setting animated:NO];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)button_addfriend:(id)sender
{
    AddFriendViewController * addFriend = [self.storyboard instantiateViewControllerWithIdentifier:@"AddFriendViewController"];
    [self.navigationController pushViewController:addFriend animated:NO];
}
- (IBAction)but_friend:(id)sender
{
   
    [but_friend setTitleColor:[UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1] forState:UIControlStateNormal];
    [but_youProp setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    table_friend.hidden = YES;
    view_addFriendForYou.hidden = YES;
    view_addFriendForFriends.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frm = view_friend.frame;
        frm.origin.x = (self.view.frame.size.width/2)+2;
        view_friend.frame = frm;
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    friendTableViewCell * cell = [table_friend dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.img_userImg.layer.cornerRadius  = cell.img_userImg.frame.size.height/2;
    cell.img_userImg.clipsToBounds = YES;

    if (indexPath.row == 0) {
        cell.img_reply.hidden = YES;
        cell.lbl_replytime.hidden = YES;
    }
    else{
        cell.img_reply.hidden = NO;
        cell.lbl_replytime.hidden = NO;
        cell.img_listcheck.image = [UIImage imageNamed:@"listr_uncheck.png"];
        }
    return cell;
}
-(IBAction)but_help:(id)sender
{
    imgBack.hidden = NO;
    view_help.hidden = NO;
}
-(IBAction)but_cross:(id)sender
{
    imgBack.hidden = YES;
    view_help.hidden = YES;
}
@end
