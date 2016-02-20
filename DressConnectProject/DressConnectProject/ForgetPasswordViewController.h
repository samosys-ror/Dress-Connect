//
//  ForgetPasswordViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/15/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"
@interface ForgetPasswordViewController : UIViewController<UITextFieldDelegate>
- (IBAction)backButton:(id)sender;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextField *txt_email;
- (IBAction)buttonSubmit:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *buttonSubmitProp;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Emailrequired;
@property (strong, nonatomic) IBOutlet UIView *view_email;
@property IBOutlet UIImageView * img_indicatorView;
-(IBAction)hideKey:(id)sender;
@end
