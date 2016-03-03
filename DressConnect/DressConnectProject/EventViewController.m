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
    NSString * capMonthStr;
    NSMutableArray * titleArray;
    NSIndexPath * lastIndexPath;
    WebserviceViewController *web;
    MBProgressHUD *HUD;
    int indexPathCount;
    UIRefreshControl * refreshControl;
    NSInteger defaultAccesoryChk;
    NSMutableArray *eventdate,*eventtitle,*eventid,*datekey;
    NSMutableArray *unique;
    NSMutableDictionary *dataaaa,*maindic;
    
}
@end

@implementation EventViewController
BOOL buttonPress = NO;
@synthesize table_viewTitle,table_description,button_upcoming,img_scrolldown,view_shedow,view_tabBar,butTabBarSelected;
- (void)viewDidLoad {
    [super viewDidLoad];
    //Allocation of Array
    titleArray = [[NSMutableArray alloc]initWithObjects:@"Upcoming",@"Invites",@"Created",@"Past",@"Declined",nil];
    // Do any additional setup after loading the view.
    //For tab bar View
    [view_tabBar setBackgroundColor:[UIColor colorWithRed:33/255 green:34/255 blue:38/255 alpha:1.0]];
    [view_shedow setBackgroundColor:[UIColor colorWithRed:(175/255.0) green:(175/255.0) blue:(175/255.0) alpha:1]];
    view_shedow.hidden = NO;
    capMonthStr = nil;
    
//    if (self.view.frame.size.height==480)
//    {
//        if(table_description)
//        {
//            view_shedow.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+109, self.view.frame.size.width,1);
//            
//            table_description.frame = CGRectMake(0,110+self.table_viewTitle.frame.size.height,self.view.frame.size.width,160);
//            
//        }
//        if(table_viewTitle)
//        {
//            table_viewTitle.frame = CGRectMake(0,100, self.view.frame.size.width,self.table_viewTitle.frame.size.height);
//        }
//    }
//    
//    else if (self.view.frame.size.height==568)
//    {
//        view_shedow.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+99, self.view.frame.size.width,1);
//        if(table_description)
//        {
//            table_description.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+100, self.view.frame.size.width,226);
//        }
//        if(table_viewTitle)
//        {
//            table_viewTitle.frame = CGRectMake(0,110, self.view.frame.size.width,self.table_viewTitle.frame.size.height);
//        }
//    }
//    
//    else if(self.view.frame.size.height==667)
//    {
//        if(table_description)
//        {
//            view_shedow.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+69, self.view.frame.size.width,1);
//            table_description.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+70, self.view.frame.size.width,321);
//        }
//        if(table_viewTitle)
//        {
//            table_viewTitle.frame = CGRectMake(0,110, self.view.frame.size.width,self.table_viewTitle.frame.size.height);
//        }
//    }
//    else
//    {
//        if(table_description)
//        {
//            view_shedow.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+49, self.view.frame.size.width,1);
//            table_description.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+50, self.view.frame.size.width,385);
//        }
//        if(table_viewTitle)
//        {
//            table_viewTitle.frame = CGRectMake(0,110, self.view.frame.size.width,230);
//        }
//    }
    
    buttonPress = YES;
    
    table_description.frame = CGRectMake(0, 110,self.view.frame.size.width,self.view.frame.size.height-160);
    img_scrolldown.image  = [UIImage imageNamed:@"DropDown.png"];
    view_shedow.hidden = YES;
    //Instance Refresh Control Type
    refreshControl = [[UIRefreshControl alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-refreshControl.frame.size.width/2, 70, refreshControl.frame.size.width, refreshControl.frame.size.height)];
    
    [refreshControl addTarget:self action:@selector(getTrackData) forControlEvents:UIControlEventValueChanged];
    
   // [table_description addSubview:refreshControl];
    //For Default Accessory CheckMark
    defaultAccesoryChk = 1;
}
-(void)getTrackData
{
    NSString *userid = [[NSUserDefaults standardUserDefaults]valueForKey:@"userid"];
    web = [[WebserviceViewController alloc]init];
    //[web GetEventDetail:@selector(getcreateEventDetailResult:) tempTarget:self :userid];
    [web show_event:@selector(show_eventMethod:) tempTarget:self :userid];
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [refreshControl endRefreshing];
}
-(void)viewWillAppear:(BOOL)animated
{
    [butTabBarSelected setBackgroundColor:[UIColor colorWithRed:33.0/255.0 green:38.0/255.0 blue:42.0/255.0 alpha:1.0]];
    NSString *userid = [[NSUserDefaults standardUserDefaults]valueForKey:@"userid"];
    NSLog(@"Login %@",userid);
    web = [[WebserviceViewController alloc]init];
    //[web GetEventDetail:@selector(getcreateEventDetailResult:) tempTarget:self :userid];
    [web show_event:@selector(show_eventMethod:) tempTarget:self :userid];
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
-(void)show_eventMethod:(NSDictionary *)dict_Responce{
    NSLog(@"%@",dict_Responce);
    eventdate=[[NSMutableArray alloc]init];
    eventtitle=[[NSMutableArray alloc]init];
    eventid=[[NSMutableArray alloc]init];
    datekey=[[NSMutableArray alloc]init];
    dataaaa=[[NSMutableDictionary alloc]init];
    maindic=[[NSMutableDictionary alloc]init];
    unique = [NSMutableArray array];
    [HUD hide:YES];
    if ([dict_Responce isEqual:[NSNull null]]) {
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1)
        {
            datekey=[[dict_Responce objectForKey:@"response"]objectForKey:@"month"];
            //            totalcount=[[[[dict_Responce objectForKey:@"response"]objectForKey:@"count"]objectAtIndex:0] integerValue];
            //            e=unique.count;
            for (id obj in datekey) {
                if (![unique containsObject:obj]) {
                    [unique addObject:obj];
                    // [datesforcal addObject:obj];
                }
            }
            for(int i=0;i<[unique count];i++)
                
            {
                
                //NSLog(@"%d",(int)[[[dict_Responce objectForKey:@"response"] objectForKey:unique[i]] count]);
                for(int j=0;j<[[[dict_Responce objectForKey:@"response"]objectForKey:unique[i]] count];j++)
                {
                    [eventtitle addObject:[[[dict_Responce objectForKey:@"response"]objectForKey:unique[i] ] valueForKey:@"title"][j]];
                    [eventdate addObject:[[[dict_Responce objectForKey:@"response"]objectForKey:unique[i] ] valueForKey:@"eventdate"][j]];
                    [eventid addObject:[[[dict_Responce objectForKey:@"response"]objectForKey:unique[i] ] valueForKey:@"id"][j]];
                }
                
                [dataaaa setObject:eventdate forKey:@"eventdate"];
                [dataaaa setObject:eventtitle forKey:@"eventname"];
                
                [maindic setObject:dataaaa forKey:unique[i]];
                
                [[NSUserDefaults standardUserDefaults] setObject:maindic forKey:unique[i]];
                [dataaaa removeAllObjects];
                [eventdate removeAllObjects];
                [eventtitle removeAllObjects];
            }
        }
        else
        {
            [[[UIAlertView alloc]initWithTitle:@"" message:@"No record found!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
            
        }
        
    }
    [table_description reloadData];
}
-(IBAction)button_tabBar:(id)sender
{
    if ([sender tag]==1) {
        HomeViewController * homeview = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:homeview animated:NO];
        
    }
    else if ([sender tag]==2)
    {
        
    }
    else if ([sender tag]==3)
    {
        
    }
    else if ([sender tag]==4)
    {
        OutfitViewController * outfit = [self.storyboard instantiateViewControllerWithIdentifier:@"OutfitViewController"];
        [self.navigationController pushViewController:outfit animated:NO];
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == table_viewTitle) {
        return 1;
    }
    else
    {
        return maindic.count;
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == table_viewTitle) {
        return titleArray.count;
    }
    else
    {
        maindic=[[[NSUserDefaults standardUserDefaults] objectForKey:unique[section]] mutableCopy];
        return [[[maindic objectForKey:unique[section]]objectForKey:@"eventname" ] count];
    }
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    if (tableView == table_viewTitle) {
        UITableViewCell * cell = [table_viewTitle dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]init];
        }
        
        cell.textLabel.text = [titleArray objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = [UIColor scrollViewTexturedBackgroundColor];
        // button_upcoming setting
        [self.table_viewTitle setTintColor:[UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1]];
        if ([indexPath compare:lastIndexPath] == NSOrderedSame)
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        }
        else
        {
            if (defaultAccesoryChk == 1 && indexPath.row == 0) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                defaultAccesoryChk = 0;
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
        return cell;
    }
    else{
        DescriptionTableViewCell * cell = [table_description dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
        maindic=[[[NSUserDefaults standardUserDefaults] objectForKey:unique[indexPath.section]] mutableCopy];
        cell.lbl_title.text=[[maindic objectForKey:unique[indexPath.section]]objectForKey:@"eventname"][indexPath.row];
        //cell.lbl_date.text=[[maindic objectForKey:unique[indexPath.section]]objectForKey:@"eventdate"][indexPath.row];
        NSString * stDate =[[maindic objectForKey:unique[indexPath.section]]objectForKey:@"eventdate"][indexPath.row];
        NSDateFormatter *formet = [[NSDateFormatter alloc]init];
        [formet setDateFormat:@"dd-MM-yyyy"];
        NSDate *date=[formet dateFromString:stDate];
        [formet setDateFormat:@"MMM"];
        NSString *uppercase = [formet stringFromDate:date];
        cell.lbl_month.text =  [uppercase uppercaseString];
        [formet setDateFormat:@"dd"];
        cell.lbl_day.text= [formet stringFromDate:date];
        [formet setDateFormat:@"EEEE, d MMMM"];
        cell.lbl_date.text= [formet stringFromDate:date];
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == table_viewTitle) {
        lastIndexPath = indexPath;
        indexPathCount = indexPath.row;
        [tableView reloadData];
        [button_upcoming setTitle:[titleArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    }
    // for Table
    
    //     table_description.frame = CGRectMake(0, 110,self.view.frame.size.width,self.view.frame.size.height-160);
    //    buttonPress = YES;
}

- (IBAction)but_create:(id)sender {
    CreateEventViewController * createEvent = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateEventViewController"];
    [self.navigationController pushViewController:createEvent animated:YES];
}

- (IBAction)but_upcoming:(id)sender
{
    if (buttonPress == YES)
    {
        buttonPress = NO;
        img_scrolldown.image  = [UIImage imageNamed:@"DropUp.png"];
        if (self.view.frame.size.height==480)
        {
            if(table_description)
            {
                view_shedow.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+109, self.view.frame.size.width,1);
                table_description.frame = CGRectMake(0,110+self.table_viewTitle.frame.size.height,self.view.frame.size.width,158);
            }
            if(table_viewTitle)
            {
                table_viewTitle.frame = CGRectMake(0,100, self.view.frame.size.width,self.table_viewTitle.frame.size.height);
            }
        }
        else if (self.view.frame.size.height==568)
        {
            view_shedow.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+99, self.view.frame.size.width,1);
            if(table_description)
            {
                table_description.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+100, self.view.frame.size.width,226);
            }
            if(table_viewTitle)
            {
                table_viewTitle.frame = CGRectMake(0,110, self.view.frame.size.width,self.table_viewTitle.frame.size.height);
            }
        }
        
        else if(self.view.frame.size.height==667)
        {
            if(table_description)
            {
                view_shedow.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+69, self.view.frame.size.width,1);
                table_description.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+70, self.view.frame.size.width,321);
            }
            if(table_viewTitle)
            {
                table_viewTitle.frame = CGRectMake(0,110, self.view.frame.size.width,self.table_viewTitle.frame.size.height);
            }
        }
        else
        {
            if(table_description)
            {
                view_shedow.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+69, self.view.frame.size.width,1);
                table_description.frame = CGRectMake(0,self.table_viewTitle.frame.size.height+70, self.view.frame.size.width,385);
            }
            if(table_viewTitle)
            {
                table_viewTitle.frame = CGRectMake(0,110, self.view.frame.size.width,self.table_viewTitle.frame.size.height);
            }
        }
        view_shedow.hidden = NO;
    }
    else
    {
        buttonPress = YES;
        
        table_description.frame = CGRectMake(0, 110,self.view.frame.size.width,self.view.frame.size.height-160);
        img_scrolldown.image  = [UIImage imageNamed:@"DropDown.png"];
        view_shedow.hidden = YES;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (table_description==tableView) {
        return 30;
    }
    else
        return 0;
}

-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == table_description)
    {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.table_description.frame.size.width,30)];
        [headerView setBackgroundColor:[UIColor colorWithRed:(224/255.0) green:(224/255.0) blue:(224/255.0) alpha:1]];
        UILabel *title =[[UILabel alloc]initWithFrame:CGRectMake(15, 5, 250, 20)];
        //55/55/55text
        title.textColor=[UIColor colorWithRed:(55/255.0) green:(55/255.0) blue:(55/255.0) alpha:1];
        title.font = [UIFont boldSystemFontOfSize:13];
        NSString *string =unique[section];
        title.text = string;
        [headerView addSubview:title];
        return headerView;
    }
    else
    {
        return 0;
    }
}


@end
