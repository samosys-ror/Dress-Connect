//
//  EventViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "EventViewController.h"
#import "WebserviceViewController.h"
#import "MBProgressHUD.h"


@interface EventViewController ()
{
    NSMutableArray * titleArray;
    NSIndexPath * lastIndexPath;
    WebserviceViewController *web;
    MBProgressHUD *HUD;
    int indexPathCount;
    
}
@end

@implementation EventViewController
BOOL buttonPress = NO;
@synthesize table_viewTitle,tabBar,table_description,button_upcoming;
- (void)viewDidLoad {
    [super viewDidLoad];
    titleArray = [[NSMutableArray alloc]initWithObjects:@"Upcoming",@"Invites",@"Created",@"Past",@"Declined",nil];
    // Do any additional setup after loading the view.
    [UITabBarItem.appearance setTitleTextAttributes:
     @{NSForegroundColorAttributeName : [UIColor whiteColor]}
                                           forState:UIControlStateNormal];
    for (UITabBarItem  *tab in tabBar.items) {
        tab.image = [tab.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        tab.selectedImage = [tab.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    }
    NSString *userid = [[NSUserDefaults standardUserDefaults]valueForKey:@"userid"];
    NSLog(@"Login %@",userid);
    // For Getting UserID
//    web = [[WebserviceViewController alloc]init];
//    [web GetEventDetail:@selector(getcreateEventResult:) tempTarget:self :userid];
//    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == table_viewTitle) {
        return 1;
    }
    else
    {
        return 2;
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == table_viewTitle) {
        return titleArray.count;
    }
    else
    {
        if (section == 1) {
            return 1;
        }
        else
        {
            return 2;
        }
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == table_viewTitle) {
        UITableViewCell * cell = [table_viewTitle dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]init];
        }
        
        cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:10];
        cell.textLabel.textColor = [UIColor scrollViewTexturedBackgroundColor];
//        button_upcoming setti
        if ([indexPath compare:lastIndexPath] == NSOrderedSame)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }
    else{
        DescriptionTableViewCell * cell = [table_description dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
        
                return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == table_viewTitle) {
        lastIndexPath = indexPath;
        indexPathCount = indexPath.row;
        [tableView reloadData];
    }
    // for Table
    [button_upcoming setTitle:[titleArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
//     table_description.frame = CGRectMake(0, 110,self.view.frame.size.width,self.view.frame.size.height-160);
//    buttonPress = YES;
    
    
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title isEqual:@"Home"])
    {
        HomeViewController * homeview = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:homeview animated:YES];
    }
    else if ([item.title isEqual:@"Events"])
    {
        
    }
    else if ([item.title isEqual:@"Outfits"])
    {
        OutfitViewController * outfit = [self.storyboard instantiateViewControllerWithIdentifier:@"OutfitViewController"];
        [self.navigationController pushViewController:outfit animated:YES];
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

- (IBAction)but_create:(id)sender {
    CreateEventViewController * createEvent = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateEventViewController"];
    [self.navigationController pushViewController:createEvent animated:YES];
    
}

- (IBAction)but_upcoming:(id)sender {
    
    if (buttonPress == YES) {
        
        buttonPress = NO;
        table_description.frame = CGRectMake(0,110+self.table_viewTitle.frame.size.height,self.view.frame.size.width,self.table_description.frame.size.height-200);
 
    }
     else
    {
        buttonPress = YES;
        
        table_description.frame = CGRectMake(0, 110,self.view.frame.size.width,self.view.frame.size.height-160);
        
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (table_description==tableView) {
        return 20;
    }
    else
        return 0;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == table_description) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
        [headerView setBackgroundColor:[UIColor darkGrayColor]];
        UILabel *title =[[UILabel alloc]initWithFrame:CGRectMake(15, 0, 250, 20)];
        title.textColor=[UIColor whiteColor];
        title.font = [UIFont boldSystemFontOfSize:15];
        if(section==0)
        {
            title.text = @"August 2015";
        }
        if(section == 1)
        {
            title.text = @"September 2015";
        }
        [headerView addSubview:title];
        return headerView;
    }
    else
    {
        return 0;
    }
}

@end
