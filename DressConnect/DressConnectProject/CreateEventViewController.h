//
//  CreateEventViewController.h
//  DressConnectProject
//
//  Created by samosys on 2/18/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"
@interface CreateEventViewController : UIViewController<UITextFieldDelegate>
- (IBAction)but_cross:(id)sender;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextField *txt_eventTitle;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextField *txt_date;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextField *txt_location;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextField *txt_dressCode;
@property (strong, nonatomic) IBOutlet UIButton *but_createProp;
- (IBAction)but_create:(id)sender;
-(IBAction)hide_key:(id)sender;
@property IBOutlet UILabel * lbl_done;
@property IBOutlet UIButton * but_done;
@property (strong, nonatomic) IBOutlet UIView *view_title;
@property (strong, nonatomic) IBOutlet UIView *view_date;
@property (strong, nonatomic) IBOutlet UIView *view_location;
@property (strong, nonatomic) IBOutlet UIView *view_dresscode;
@property (strong, nonatomic) IBOutlet UILabel *lbl_title;
@property (strong, nonatomic) IBOutlet UILabel *lbl_date;
@property (strong, nonatomic) IBOutlet UILabel *lbl_location;
@property (strong, nonatomic) IBOutlet UILabel *lbl_dresscode;






@end
