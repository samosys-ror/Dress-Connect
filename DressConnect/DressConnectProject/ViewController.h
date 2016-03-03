//
//  ViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/15/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterationViewController.h"
#import "LoginViewController.h" 

@interface ViewController : UIViewController
- (IBAction)resisterButton:(id)sender;
- (IBAction)loginButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *buttonResister;
@property (strong, nonatomic) IBOutlet UIButton *buttonLogin;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic) CATransformLayer *backgroundLayer;
@property (nonatomic) CALayer *orangeSquare;

@end

