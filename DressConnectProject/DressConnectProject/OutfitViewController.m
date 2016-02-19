//
//  OutfitViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/18/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "OutfitViewController.h"

@interface OutfitViewController ()

@end

@implementation OutfitViewController
@synthesize view_friend,view_you,table_friend,tabBar,but_youProp;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [UITabBarItem.appearance setTitleTextAttributes:
     @{NSForegroundColorAttributeName : [UIColor whiteColor]}
                                           forState:UIControlStateNormal];
    for (UITabBarItem  *tab in tabBar.items)
    {
        tab.image = [tab.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
        tab.selectedImage = [tab.image imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    }
//    view_friend.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [but_youProp addTarget:self action:@selector(but_youPropTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self but_youPropTapped:self];
}
-(void)but_youPropTapped:sender
{
    view_friend.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [view_you setBackgroundColor:[UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1]];
        table_friend.hidden =YES;
 
}
-(void)viewWillAppear:(BOOL)animated
{
    table_friend.hidden = YES;
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag==1) {
        HomeViewController * homeview = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
        [self.navigationController pushViewController:homeview animated:YES];
    }
    else if (item.tag==2)
    {
        EventViewController * event = [self.storyboard instantiateViewControllerWithIdentifier:@"EventViewController"];
        [self.navigationController pushViewController:event animated:YES];
    }
    else if (item.tag==4)
    {
       
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

//- (IBAction)but_you:(id)sender
//{
//    view_friend.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    [view_you setBackgroundColor:[UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1]];
//    table_friend.hidden =YES;
//}

- (IBAction)but_friend:(id)sender
{
    view_you.backgroundColor = [UIColor groupTableViewBackgroundColor   ];
    [view_friend setBackgroundColor:[UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1]];
    table_friend.hidden = NO;
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
@end
