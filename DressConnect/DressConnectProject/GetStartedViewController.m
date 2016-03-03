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
    NSTimer *timer;
}
@end

@implementation GetStartedViewController
@synthesize scrollView,pageControl,img_scroll,but_countinue;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    color = [[NSMutableArray alloc] init];
        //[resent]
    color =[[NSMutableArray alloc]initWithObjects:@"img1.png", @"img2.png", @"img3.png", nil];
    
    
    CGRect frame=scrollView.frame;
    frame.size.width=scrollView.frame.size.width * color.count;
    scrollView.contentSize=CGSizeMake(frame.size.width, scrollView.frame.size.height);
    
    img_scroll.image = [UIImage imageNamed:[color objectAtIndex:0]];
    but_countinue.layer.cornerRadius = 17.35;
    //  NSLog(@"2.....%f",self.imageScrollView.frame.size.width);
    for (int i = 0; i < color.count; i++)
    {
        CGRect frame;
        frame.origin.x = scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = scrollView.frame.size;
        
        UIImageView *subview = [[UIImageView alloc] initWithFrame:frame];
        subview.contentMode=UIViewContentModeScaleToFill;
        
        UIImage *image = [UIImage imageNamed:[color objectAtIndex:i]];
        subview.image = image;
        [scrollView addSubview:subview];
        [scrollView sendSubviewToBack:subview];
    }
    
    pageControl.numberOfPages=color.count;
    timer=[NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width; // you need to have a **iVar** with getter for scrollView
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page; // you need to have a **iVar** with getter for pageControl
    img_scroll.image = [UIImage imageNamed:[color objectAtIndex:page]];
    if (page == 2) {
        [but_countinue setTitle:@"CONTINUE" forState:UIControlStateNormal];
        but_countinue.backgroundColor = [UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1];
    }
    else
    {
        [but_countinue setTitle:@"SKIP" forState:UIControlStateNormal];
        but_countinue.backgroundColor = [UIColor clearColor];
    }
}
-(void)scrollingTimer
{
    CGFloat contentOffset = scrollView.contentOffset.x;
     //NSLog(@"%f",self.scrollView.contentOffset.x);
    int nextPage = (int)(contentOffset/scrollView.frame.size.width)+1;

       if( nextPage!=color.count)
    {
        [scrollView scrollRectToVisible:CGRectMake(nextPage*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:YES];
        but_countinue.backgroundColor = [UIColor clearColor];
        [but_countinue setTitle:@"SKIP" forState:UIControlStateNormal];
    }
    else
    {
        [scrollView setContentOffset:CGPointMake(0,0) animated:NO];
        pageControl.currentPage=0;
        nextPage=0;
         pageControl.numberOfPages=color.count;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)but_skip:(id)sender {
    [timer invalidate];
    AskingNotificationViewController * askNotification = [self.storyboard instantiateViewControllerWithIdentifier:@"AskingNotificationViewController"];
    [self.navigationController pushViewController:askNotification animated:YES];
}
@end
