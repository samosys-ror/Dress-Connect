//
//  CreateEventViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/18/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "CreateEventViewController.h"
#import "WebserviceViewController.h"
#import "MBProgressHUD.h"


@interface CreateEventViewController ()
{
    UIDatePicker *datePicker;
    WebserviceViewController *web;
    MBProgressHUD *HUD;
}
@end

@implementation CreateEventViewController
@synthesize  txt_date,txt_dressCode,txt_eventTitle,txt_location,lbl_done,but_done,but_createProp;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    but_createProp.layer.cornerRadius  = 19.35;
    //for Date Picker
    txt_date.delegate = self;
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [txt_date setInputView:datePicker];
    
    // For Button Done for Date Picker
    [but_done addTarget:self action:@selector(butDoneclicked) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)butDoneclicked
{
    lbl_done.hidden = YES;
    but_done.hidden = YES;
    [self.view endEditing:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    but_done.hidden = YES;
    lbl_done.hidden = YES;
}

-(void)updateTextField:(id)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyyy"];
    NSString * datestr = [df stringFromDate:datePicker.date];
    txt_date.text = [NSString stringWithFormat:@"%@",datestr];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)hide_key:(id)sender
{
    [self resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (txt_date == textField) {
        lbl_done.frame = CGRectMake(0, self.view.frame.size.height-datePicker.frame.size.height-37, self.view.frame.size.width,37);
        but_done.frame = CGRectMake(15,self.view.frame.size.height-datePicker.frame.size.height-33,46,30);
        but_done.hidden  =NO;
        lbl_done.hidden = NO;
    }
    else
    {
    but_done.hidden  =YES;
    lbl_done.hidden = YES;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)but_cross:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)but_create:(id)sender
{
    if (txt_eventTitle.text.length > 0 && txt_date.text.length > 0 && txt_dressCode.text.length > 0 && txt_location.text.length > 0)
    {
    //do Action
        web = [[WebserviceViewController alloc]init];
        [web InsertEvent:@selector(getcreateEventResult:) tempTarget:self :@"USERID" :txt_eventTitle.text :txt_location.text :txt_dressCode.text];
        HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please Fill all the Field" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}
-(void)getcreateEventResult:(NSDictionary *)dict_Responce{
    NSLog(@"%@",dict_Responce);
    [HUD hide:YES];
    if ([dict_Responce isEqual:[NSNull null]]) {
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1) {
//            HomeViewController * home = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
//            [self.navigationController pushViewController:home animated:YES];
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Event Created Successful." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
        }
        else{
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Some Error in Creating Event" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        }
        
    }
}
@end
