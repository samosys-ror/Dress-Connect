//
//  CompleteProfileViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/16/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetStartedViewController.h"

@interface CompleteProfileViewController : UIViewController<UIActionSheetDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *profile_imageView;
- (IBAction)button_addPhoto:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt_fullName;
@property (strong, nonatomic) IBOutlet UITextField *txt_gender;
@property (strong, nonatomic) IBOutlet UITextField *txt_dob;
- (IBAction)button_submit:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *button_submitProp;
@property (strong, nonatomic) IBOutlet UIButton *button_completeProfile;
-(IBAction)hideKey:(id)sender;
@property IBOutlet UILabel * lbl_done;
@property IBOutlet UIButton * but_done;
@property IBOutlet UITableView * table_gender;
@property NSString *email;
@property NSString *name;
@property NSString *password;
@property IBOutlet UIImageView * img_indicatorView;



@end
