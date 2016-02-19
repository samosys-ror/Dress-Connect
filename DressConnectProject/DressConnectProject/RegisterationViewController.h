//
//  RegisterationViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/15/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompleteProfileViewController.h"

@interface RegisterationViewController : UIViewController<UITextFieldDelegate>
- (IBAction)backButton:(id)sender;
- (IBAction)fbRegisterButton:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt_email;
@property (strong, nonatomic) IBOutlet UITextField *txt_name;
@property (strong, nonatomic) IBOutlet UITextField *txt_password;
- (IBAction)submitbutton:(id)sender;
-(IBAction)hideKey:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *buttonSubmit;
@property (strong, nonatomic) IBOutlet UIView *view_email;
@property (strong, nonatomic) IBOutlet UIView *view_name;
@property (strong, nonatomic) IBOutlet UIView *view_password;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Emailrequired;
@property (strong, nonatomic) IBOutlet UILabel *lbl_NameRequired;
@property (strong, nonatomic) IBOutlet UILabel *lbl_passwordRequired;
@property IBOutlet UIImageView * img_indicatorView;



@end
