//
//  GetStartedViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/16/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AskingNotificationViewController.h"
#import "HomeViewController.h"

@interface GetStartedViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView * img_scroll;
@property (strong, nonatomic) IBOutlet UIButton * but_countinue;
@property (strong, nonatomic) IBOutlet UIScrollView * scrollView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)but_skip:(id)sender;


@end