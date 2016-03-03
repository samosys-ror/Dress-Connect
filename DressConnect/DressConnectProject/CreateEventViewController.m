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
    UIActivityIndicatorView * indicator_View;
    int i,j,k,l;
    NSString * monthStr;

}
@end

@implementation CreateEventViewController
@synthesize  txt_date,txt_dressCode,txt_eventTitle,txt_location,lbl_done,but_done,but_createProp,lbl_date,lbl_dresscode,lbl_location,lbl_title,view_date,view_dresscode,view_location,view_title;
- (void)viewDidLoad {
    [super viewDidLoad];
    txt_dressCode.delegate = self;
    txt_eventTitle.delegate = self;
    txt_location.delegate = self;
    // Do any additional setup after loading the view.
    but_createProp.layer.cornerRadius  = 19.35;
    //for Date Picker
    txt_date.delegate = self;
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    datePicker.minimumDate = [NSDate date];
    [txt_date setInputView:datePicker];
    
    // For Button Done for Date Picker
    [but_done addTarget:self action:@selector(butDoneclicked) forControlEvents:UIControlEventTouchUpInside];
    const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;
    txt_date.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_dressCode.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_eventTitle.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_location.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];


    // For Indicator View
    indicator_View = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator_View.frame = CGRectMake((self.view.frame.size.width/2)-20,but_createProp.frame.origin.y, 40,40);
    [self.view addSubview:indicator_View];
    i =but_createProp.frame.origin.x;
    j =but_createProp.frame.origin.y;
    k = but_createProp.frame.size.width;
    l = but_createProp.frame.size.height;
 

}
-(void)buttonFrame
{
    but_createProp.frame = CGRectMake(i,j,k,l);
    [but_createProp setTitle:@"CREATE" forState:UIControlStateNormal];
    
    but_createProp.layer.cornerRadius = 19.35;
    
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
    [df setDateFormat:@"d MMM yyyy"];
    NSString * datestr = [df stringFromDate:datePicker.date];
    txt_date.text = [NSString stringWithFormat:@"%@",datestr];
    [df setDateFormat:@"MMMM YYYY"];
    monthStr = [df stringFromDate:datePicker.date];
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
    lbl_title.hidden = YES;
    lbl_date.hidden = YES;
    lbl_dresscode.hidden = YES;
    lbl_location.hidden = YES;

    [view_title setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_location setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_dresscode setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_date setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
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
    [self.view endEditing:YES];
    int ind = 0;
    if (txt_eventTitle.text.length == 0) {
        lbl_title.hidden = NO;
        [view_title setBackgroundColor:[UIColor redColor]];
        ind = 1;
 
    }
    else{
        lbl_title.hidden = YES;
        [view_title setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    if (txt_date.text.length == 0) {
        lbl_date.hidden = NO;
        [view_date setBackgroundColor:[UIColor redColor]];
        ind = 1;
    }
    else
    {
        lbl_date.hidden = YES;
        [view_date setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    if (txt_dressCode.text.length == 0) {
        lbl_dresscode.hidden = NO;
        [view_dresscode setBackgroundColor:[UIColor redColor]];
        ind = 1;
    }
    else
    {
        lbl_dresscode.hidden = YES;
        [view_dresscode setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    if (txt_location.text.length == 0) {
        lbl_location.hidden = NO;
        [view_location setBackgroundColor:[UIColor redColor]];
        ind = 1;
    }
    else
    {
        lbl_location.hidden = YES;
        [view_location setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    if (txt_eventTitle.text.length > 0 && txt_date.text.length > 0 && txt_dressCode.text.length > 0 && txt_location.text.length > 0)
    {
        
            //do Action
        //for indicator view
        [but_createProp setTitle:@"" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.30 animations:^{
            but_createProp.frame = CGRectMake((self.view.frame.size.width/2)-20 , but_createProp.frame.origin.y ,40, but_createProp.frame.size.height);
            but_createProp.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
        [self performSelector:@selector(animaStart)  withObject:nil afterDelay:0.30];
        [self performSelector:@selector(SubmitClicked)  withObject:nil afterDelay:1.0];
        }
}
-(void)animaStart{
    [indicator_View startAnimating];
}
-(void)SubmitClicked
{
    NSDateFormatter *dateForm = [[NSDateFormatter alloc] init];
    [dateForm setDateFormat:@"dd-MM-yyyy"];
    NSString * datestr = [dateForm stringFromDate:datePicker.date];
    txt_date.text = [NSString stringWithFormat:@"%@",datestr];
    
    NSString *userid = [[NSUserDefaults standardUserDefaults]valueForKey:@"userid"];
    web = [[WebserviceViewController alloc]init];
    [web InsertEvent:@selector(getcreateEventResult:) tempTarget:self :userid :txt_eventTitle.text :txt_location.text :txt_dressCode.text :txt_date.text : monthStr];
   // HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
}
-(void)getcreateEventResult:(NSDictionary *)dict_Responce{
    NSLog(@"%@",dict_Responce);
    //[HUD hide:YES];
    if ([dict_Responce isEqual:[NSNull null]]) {
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1) {
            
            [self.navigationController popViewControllerAnimated:YES];
            
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Event Created Successful." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
            [indicator_View stopAnimating];
        }
        else{
            [self buttonFrame];
            but_createProp.hidden = NO;
            [indicator_View stopAnimating];
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Some Error in Creating Event" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            

        }
        
    }
}
@end
