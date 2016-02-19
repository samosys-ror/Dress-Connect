//
//  CompleteProfileViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/16/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "CompleteProfileViewController.h"
#import "WebserviceViewController.h"
#import "MBProgressHUD.h"
@interface CompleteProfileViewController ()
{
    UIDatePicker *datePicker;
    WebserviceViewController *web;
    MBProgressHUD *HUD;
    NSArray * genderArr;
}
@end

@implementation CompleteProfileViewController
@synthesize txt_fullName,txt_gender,txt_dob,button_submitProp,button_completeProfile,lbl_done,but_done,table_gender;

- (void)viewDidLoad {
    [super viewDidLoad];
    txt_fullName.delegate = self;
    
    [but_done addTarget:self action:@selector(butDoneclicked) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
    button_submitProp.layer.cornerRadius  = 19.35;
    button_completeProfile.layer.cornerRadius = self.button_completeProfile.frame.size.height/2;
    button_completeProfile.layer.borderWidth=1.0f;
    button_completeProfile.layer.borderColor =  [UIColor colorWithRed:39 green:189 blue:149 alpha:1].CGColor;
    button_completeProfile.layer.borderColor = [UIColor greenColor].CGColor;
    button_completeProfile.clipsToBounds = YES;
    
    //for date picker
    txt_dob.delegate = self;
    datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    datePicker.maximumDate =[NSDate date];
    [datePicker setDatePickerMode:UIDatePickerModeDate];
       [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [txt_dob setInputView:datePicker];
    
    // For Gender
    txt_gender.delegate = self;
    table_gender.delegate = self;
    table_gender.dataSource  =self;
    genderArr = [NSArray arrayWithObjects:@"Male",@"Female",nil];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    but_done.hidden = YES;
    lbl_done.hidden = YES;
    table_gender.hidden = YES;
}
-(void)updateTextField:(id)sender
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyyy"];
    NSString * datestr = [df stringFromDate:datePicker.date];
            txt_dob.text = [NSString stringWithFormat:@"%@",datestr];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    if (textField == txt_gender) {
        but_done.hidden  =YES;
        lbl_done.hidden = YES;
        [self.view endEditing:YES];
        table_gender.hidden  =NO;
        
    }
    if (textField == txt_dob) {
        lbl_done.hidden = NO;
        but_done.hidden = NO;
        table_gender.hidden  =YES;
        if (self.view.frame.size.height == 480)
        {
            self.view.frame = CGRectMake(self.view.frame.origin.x, -115 , self.view.frame.size.width, self.view.frame.size.height);
            [UIView commitAnimations];
            
        }
        else if (self.view.frame.size.height == 568)
        {
            self.view.frame = CGRectMake(self.view.frame.origin.x, -95 , self.view.frame.size.width, self.view.frame.size.height);
            [UIView commitAnimations];
        }
        else if (self.view.frame.size.height == 667)
        {
            self.view.frame = CGRectMake(self.view.frame.origin.x, -72 , self.view.frame.size.width, self.view.frame.size.height);
            [UIView commitAnimations];
        }
        else if (self.view.frame.size.height > 667)
        {
            self.view.frame = CGRectMake(self.view.frame.origin.x, -58 , self.view.frame.size.width, self.view.frame.size.height);
            [UIView commitAnimations];
        }


    }
    else if (textField == txt_fullName) {
        but_done.hidden  =YES;
        lbl_done.hidden = YES;
        table_gender.hidden  =YES;
    }
   
}
-(void)butDoneclicked
{
    lbl_done.hidden = YES;
    but_done.hidden = YES;
    [self.view endEditing:YES];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    table_gender.hidden = YES;
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    self.view.frame = CGRectMake(self.view.frame.origin.x, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [table_gender dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]init];
    }
    cell.textLabel.text = [genderArr objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    txt_gender.text = [genderArr objectAtIndex:indexPath.row];
    table_gender.hidden = YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)button_addPhoto:(id)sender {
    UIActionSheet *imgSheet = [[UIActionSheet alloc] initWithTitle:@"Upload Photo" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a Photo", @"Camera roll", nil];
    // [imgSheet setTag:_kAddImageActionSheet];
    [imgSheet showInView:self.view];
    
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //decide what the picker's source is
    switch (buttonIndex) {
            
        case 0:
        {
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            imgPicker.delegate = self;
            imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            //  imgPicker.cameraFlashMode = ([Utilities instance].flashMode) ? [[Utilities instance].flashMode integerValue] : UIImagePickerControllerCameraFlashModeAuto;
            [self presentViewController:imgPicker animated:YES completion:nil];
            break;
        }
        case 1:
        {
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imgPicker.delegate = self;
            [self presentViewController:imgPicker animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
}
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //dismiss the picker view
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // Get the image from the result
    UIImage* image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    self.profile_imageView.image = image;
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)button_submit:(id)sender {
    if (txt_fullName.text.length > 0) {
        if (txt_gender.text.length > 0) {
            if (txt_dob.text.length > 0) {
                // do action
                web = [[WebserviceViewController alloc]init];
                [web Registration:@selector(getRegistrationResult:) tempTarget:self :_email :_password :_name :txt_gender.text :txt_dob.text :@"":UIImageJPEGRepresentation(self.profile_imageView.image, 0.1)];
                HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
            }
            else{
                //date of birth
            }
            
        }
        else{
            //gender
        }
    }
    else{
        //gender
    }
    GetStartedViewController * starter = [self.storyboard instantiateViewControllerWithIdentifier:@"GetStartedViewController"];
        [self.navigationController pushViewController:starter animated:YES];
    
}
//-(void)getRegistrationResult:(NSDictionary*)dict_Responce{
//    NSLog(@"%@",dict_Responce);
//    [HUD hide:YES];
//    if ([dict_Responce isEqual:[NSNull null]]) {
//        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
//    }
//    else{
//        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1) {
//            GetStartedViewController * starter = [self.storyboard instantiateViewControllerWithIdentifier:@"GetStartedViewController"];
//                [self.navigationController pushViewController:starter animated:YES];
//            [[[UIAlertView alloc]initWithTitle:@"" message:@"Registration successfully completed" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
//        }
//        else{
//            [[[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"%@",[[dict_Responce valueForKey:@"response"]valueForKey:@"msg"]] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
//        }
//    }
//    GetStartedViewController * starter = [self.storyboard instantiateViewControllerWithIdentifier:@"GetStartedViewController"];
//    [self.navigationController pushViewController:starter animated:YES];
//}
-(IBAction)hideKey:(id)sender
{
    [self resignFirstResponder];
}
@end
