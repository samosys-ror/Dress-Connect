//
//  GetStartedViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/16/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AskingNotificationViewController.h"

@interface GetStartedViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *myLabel;
//@property (strong, nonatomic) IBOutlet UIButton *LetMeIn;
@property (strong, nonatomic) IBOutlet UIScrollView * scrollView;
//@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)but_Finished:(id)sender;
- (IBAction)but_skip:(id)sender;


@end