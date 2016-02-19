//
//  SettingViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/19/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
{
    NSArray * Arr_settingName1;
    NSArray * Arr_settingName2;
    NSArray * Arr_settingName3;
    NSArray * Arr_section;
    NSString * SectionStr;
}
@end

@implementation SettingViewController
@synthesize table_setting,tabBar;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Arr_settingName1  =[NSArray arrayWithObjects:
                       @"My Friends",
                       @"Add by Username / Email",
                       @"Add Facebook Friends",
                       @"Invite Facebook Friends",
                        nil];
    Arr_settingName2 = [NSArray arrayWithObjects:
                        @"Edit Profile",
                        @"Change Password",
                        @"change Email",nil];
    Arr_settingName3 = [NSArray arrayWithObjects:
                        @"Privacy Policy",
                        @"Terms",nil];
    Arr_section = [NSArray arrayWithObjects:@"FRIENDS",@"ACCOUNT",@"ABOUT",nil];
    [UITabBarItem.appearance setTitleTextAttributes:
     @{NSForegroundColorAttributeName : [UIColor whiteColor]}
                                           forState:UIControlStateNormal];
    for (UITabBarItem  *tab in tabBar.items) {
        tab.image = [tab.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        tab.selectedImage = [tab.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    }
    
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
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title isEqual:@"Home"])
    {
        HomeViewController * homeview = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:homeview animated:YES];
    }
    else if ([item.title isEqual:@"Events"])
    {
        EventViewController * event = [self.storyboard instantiateViewControllerWithIdentifier:@"EventViewController"];
        [self.navigationController pushViewController:event animated:YES];
    }
    else if ([item.title isEqual:@"Outfits"])
    {
        OutfitViewController * outfit = [self.storyboard instantiateViewControllerWithIdentifier:@"OutfitViewController"];
        [self.navigationController pushViewController:outfit animated:YES];
    }
    else if ([item.title isEqual:@"Settings"])
    {

    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        SectionStr = @"Section1";
        return 4;
        

    }
    else if (section == 1)
    {
        SectionStr = @"Section2";

        return 3;
        
    }
    else
    {
        SectionStr = @"Section3";
        return 2;
    }
}
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
        [headerView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        UILabel *title =[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 250, 20)];
        title.textColor=[UIColor darkGrayColor];
        title.font = [UIFont systemFontOfSize:10];
        if(section==0)
        {
            title.text = @"FRIENDS";
            
        }
        if(section == 1)
        {
            title.text = @"ACCOUNT";
                    }
        if (section == 2) {
            title.text = @"ABOUT";
            
        }
        [headerView addSubview:title];
        return headerView;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingTableViewCell * Cell = [table_setting dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(indexPath.section == 0)
    {
        
            Cell.lbl_setting.text = [Arr_settingName1 objectAtIndex:indexPath.row];
            
        
    }
    else if (indexPath.section == 1) {
    
                Cell.lbl_setting.text = [Arr_settingName2 objectAtIndex:indexPath.row];
        
        }
    else if (indexPath.section == 2)
    {
                Cell.lbl_setting.text = [Arr_settingName3 objectAtIndex:indexPath.row];
    }
        return Cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36;
}
@end
