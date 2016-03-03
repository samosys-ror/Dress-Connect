//
//  CompleteProfileViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/16/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetStartedViewController.h"
#import "JVFloatLabeledTextField.h"
#import "HomeViewController.h"
@interface CompleteProfileViewController : UIViewController<UIActionSheetDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *profile_imageView;
- (IBAction)button_addPhoto:(id)sender;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextField *txt_fullName;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextField *txt_gender;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextField *txt_dob;
- (IBAction)button_submit:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *button_submitProp;
@property (strong, nonatomic) IBOutlet UIButton *button_completeProfile;
-(IBAction)hideKey:(id)sender;
@property IBOutlet UILabel * lbl_done;
@property IBOutlet UIButton * but_done;
@property NSString *email;
@property NSString *name;
@property NSString *password;
@property IBOutlet UIImageView * img_plusInButton;
@property (strong, nonatomic) IBOutlet UIView *view_name;
@property (strong, nonatomic) IBOutlet UIView *view_gender;
@property (strong, nonatomic) IBOutlet UIView *view_dob;
@property (strong, nonatomic) IBOutlet UILabel *lbl_Namerequired;
@property (strong, nonatomic) IBOutlet UILabel *lbl_GenderRequired;
@property (strong, nonatomic) IBOutlet UILabel *lbl_DobRequired;
@property IBOutlet UIPickerView * picker_gender;
@property IBOutlet UIImageView * img_profileimage;



@end
