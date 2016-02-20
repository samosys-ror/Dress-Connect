//
//  GetStartedViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/16/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "GetStartedViewController.h"

@interface GetStartedViewController ()
{
    NSMutableArray * color;
    NSMutableArray * msgArray;
    NSTimer *timer;
}
@end

@implementation GetStartedViewController
@synthesize myLabel,scrollView,pageControl;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    color = [[NSMutableArray alloc] init];
    msgArray = [[NSMutableArray alloc] init];
        //[resent]
    color =[[NSMutableArray alloc]initWithObjects:@"splash.png", @"bg1.jpg", @"splash.png", nil];
    
    msgArray = [[NSMutableArray alloc] initWithObjects:@"Title is a new way to navigate,post,and connect with your community.", @"Simply Post a Product or Service; all the users in its geo-location will see it.", @"Make a connection.", nil];
    
    CGRect frame=scrollView.frame;
    frame.size.width=scrollView.frame.size.width * color.count;
    scrollView.contentSize=CGSizeMake(frame.size.width, scrollView.frame.size.height);
    
    myLabel.text = [msgArray objectAtIndex:0];
    
    //  NSLog(@"2.....%f",self.imageScrollView.frame.size.width);
    for (int i = 0; i < color.count; i++)
    {
        CGRect frame;
        frame.origin.x = scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = scrollView.frame.size;
        
        UIImageView *subview = [[UIImageView alloc] initWithFrame:frame];
        subview.contentMode=UIViewContentModeScaleAspectFill ;
        
        UIImage *image = [UIImage imageNamed:[color objectAtIndex:i]];
        subview.image = image;
        [scrollView addSubview:subview];
        [scrollView sendSubviewToBack:subview];
    }
    
    pageControl.numberOfPages=color.count;
//    timer=[NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
    
    
}
-(void)scrollingTimer
{
    CGFloat contentOffset = scrollView.contentOffset.x;
    // NSLog(@"%f",self.scrollView.contentOffset.x);
    int nextPage = (int)(contentOffset/scrollView.frame.size.width)+1;
    
       if( nextPage!=color.count)
    {
        [scrollView scrollRectToVisible:CGRectMake(nextPage*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:YES];
        myLabel.text = [msgArray objectAtIndex:nextPage];
        pageControl.currentPage=nextPage;
    }
    else
    {
        [scrollView setContentOffset:CGPointMake(0,0) animated:NO];
        pageControl.currentPage=0;
        nextPage=0;
        myLabel.text = [msgArray objectAtIndex:nextPage];
        pageControl.numberOfPages=color.count;
        
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

- (IBAction)but_Finished:(id)sender {
    
}

- (IBAction)but_skip:(id)sender {
    [timer invalidate];
    AskingNotificationViewController * askNotification = [self.storyboard instantiateViewControllerWithIdentifier:@"AskingNotificationViewController"];
    [self.navigationController pushViewController:askNotification animated:YES];
}
@end
