//
//  AddFriendViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/29/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "AddFriendViewController.h"

@interface AddFriendViewController ()
{
    NSArray * ArrAddFriend;
    NSArray * ArrImageAddFriend;
}

@end

@implementation AddFriendViewController
@synthesize viewFortabBar,lbl_name,table_addFriend,butTabBarSelected;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //For Tab View
    [viewFortabBar setBackgroundColor:[UIColor colorWithRed:33/255 green:34/255 blue:38/255 alpha:1.0]];
    ArrAddFriend = [NSArray arrayWithObjects:@"Add by Username",@"Add Facebook Friends",@"Add from Address Book",@"Add Nearby",@"Share username",nil];
    ArrImageAddFriend = [NSArray arrayWithObjects:@"username.png",@"facebook.png",@"address_book.png",@"nearby.png",@"share_username.png",nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    [butTabBarSelected setBackgroundColor:[UIColor colorWithRed:33.0/255.0 green:38.0/255.0 blue:42.0/255.0 alpha:1.0]];
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

- (IBAction)but_back:(id)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (IBAction)but_tab:(id)sender
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return ArrAddFriend.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddFriendTableViewCell * cell = [table_addFriend dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.lbl_AddFriendSource.text = [ArrAddFriend objectAtIndex:indexPath.row];
    cell.img_AddFriendicon.image = [UIImage imageNamed:[ArrImageAddFriend objectAtIndex:indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        NSMutableArray *sharingItems = [NSMutableArray new];
        UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
        [self presentViewController:activityController animated:YES completion:nil];
    }
}
@end
