//
//  HomeViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventViewController.h"
#import "OutfitViewController.h"

@interface HomeViewController : UIViewController<UITabBarDelegate>

@property (strong, nonatomic) IBOutlet UITabBar *tabBar;

@end
