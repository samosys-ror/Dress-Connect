//
//  LoginViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/15/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForgetPasswordViewController.h"
#import "HomeViewController.h"

@interface LoginViewController : UIViewController
- (IBAction)fbLoginButton:(id)sender;
- (IBAction)loginButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *loginButtonProp;
@property (strong, nonatomic) IBOutlet UITextField *txt_Loginemail;
@property (strong, nonatomic) IBOutlet UITextField *txt_loginPassword;
@property IBOutlet UIImageView * img_indicatorView;

- (IBAction)backButton:(id)sender;
-(IBAction)hideKey:(id)sender;
-(IBAction)ButtonforgotPassword:(id)sender;

@end
