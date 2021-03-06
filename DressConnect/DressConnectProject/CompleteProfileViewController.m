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
    UIActivityIndicatorView * indicator_View;
    UIImage * imageForButton;
    NSDateFormatter *df;
    int i,j,k,l;
}
@end

@implementation CompleteProfileViewController
@synthesize txt_fullName,txt_gender,txt_dob,button_submitProp,button_completeProfile,lbl_done,but_done,profile_imageView,img_plusInButton,view_name,view_gender,view_dob,lbl_DobRequired,lbl_GenderRequired,lbl_Namerequired,picker_gender,img_profileimage;

- (void)viewDidLoad {
    imageForButton = nil;
    [super viewDidLoad];
    txt_fullName.delegate = self;
    
    [but_done addTarget:self action:@selector(butDoneclicked) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
    button_submitProp.layer.cornerRadius  = 19.35;
    button_completeProfile.layer.cornerRadius = self.button_completeProfile.frame.size.height/2;
    button_completeProfile.layer.borderWidth=1.0f;
    button_completeProfile.layer.borderColor=[UIColor colorWithRed:57/255.0 green:196/255.0 blue:174/255.0 alpha:1].CGColor;
//    button_completeProfile.layer.borderColor = [UIColor greenColor].CGColor;
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
    genderArr = [NSArray arrayWithObjects:@"Select Gender",@"Male",@"Female",nil];
    
    const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;
    txt_gender.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_fullName.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_dob.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];

    //for Indicator
    indicator_View = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator_View.frame = CGRectMake((self.view.frame.size.width/2)-20,button_submitProp.frame.origin.y, 40,40);
    [self.view addSubview:indicator_View];
    i =button_submitProp.frame.origin.x;
    j =button_submitProp.frame.origin.y;
    k = button_submitProp.frame.size.width;
    l = button_submitProp.frame.size.height;

}
-(void)viewWillAppear:(BOOL)animated
{
    but_done.hidden = YES;
    lbl_done.hidden = YES;
    picker_gender.hidden = YES;
    img_profileimage.layer.cornerRadius  = img_profileimage.frame.size.height/2;
    img_profileimage.clipsToBounds = YES;

}
-(void)buttonFrame
{
    button_submitProp.frame = CGRectMake(i,j,k,l);
    [button_submitProp setTitle:@"NEXT" forState:UIControlStateNormal];
    
    button_submitProp.layer.cornerRadius = 19.35;
    
}
-(void)updateTextField:(id)sender
{
    df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"d MMMM yyyy"];
    NSString * datestr = [df stringFromDate:datePicker.date];
            txt_dob.text = [NSString stringWithFormat:@"%@",datestr];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
//    [UIView beginAnimations:@"animate" context:nil];
//    [UIView setAnimationDuration:0.35f];
//    [UIView setAnimationBeginsFromCurrentState: NO];
    if (textField == txt_gender) {
        [txt_gender resignFirstResponder];
        but_done.hidden  =NO;
        lbl_done.hidden = NO;
        [self.view endEditing:YES];
        picker_gender.hidden  =NO;
        txt_gender.inputView= picker_gender;
        
    }
    if (textField == txt_dob) {
        lbl_done.hidden = NO;
        but_done.hidden = NO;
        picker_gender.hidden  =YES;
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
        picker_gender.hidden  =YES;
    }
    
    lbl_Namerequired.hidden = YES;
    lbl_GenderRequired.hidden = YES;
     lbl_DobRequired.hidden = YES;
    [view_name setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_gender setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_dob setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField==txt_gender) {
        [txt_gender resignFirstResponder];
        [txt_fullName resignFirstResponder];
        [txt_dob resignFirstResponder];
        return YES;
    }
    return YES;
}
-(void)butDoneclicked
{
    lbl_done.hidden = YES;
    but_done.hidden = YES;
    picker_gender.hidden = YES;
    [self.view endEditing:YES];
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    picker_gender.hidden = YES;
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
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return genderArr.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [genderArr objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    [txt_gender setText:[genderArr objectAtIndex:row]];
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
    //self.profile_imageView.image = image;
    //[button_completeProfile setImage:image forState:UIControlStateNormal];
   // imageForButton = image;
    
    
   // UIImage *croppedImage = [self imageByCroppingImage:image toSize:CGSizeMake(200, 200)];
    img_profileimage.image  = image;
    [button_completeProfile setTitle:@"" forState:UIControlStateNormal];
    button_completeProfile.layer.borderWidth=0.0f;
    img_plusInButton.hidden = YES;
    img_profileimage.layer.borderWidth=2.5f;
    img_profileimage.layer.borderColor=[UIColor whiteColor].CGColor;
    
    
}
//- (UIImage *)imageByCroppingImage:(UIImage *)image toSize:(CGSize)size
//{
//    // not equivalent to image.size (which depends on the imageOrientation)!
//    double refWidth = CGImageGetWidth(image.CGImage);
//    double refHeight = CGImageGetHeight(image.CGImage);
//    
//    double x = (refWidth - size.width) / 2.0;
//    double y = (refHeight - size.height) / 2.0;
//    
//    CGRect cropRect = CGRectMake(x, y, size.height, size.width);
//    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);
//    
//    UIImage *cropped = [UIImage imageWithCGImage:imageRef scale:0.0 orientation:UIImageOrientationUp];
//    CGImageRelease(imageRef);
//    
//    return cropped;
//}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)button_submit:(id)sender {
    [self.view endEditing:YES];
    int  chekr = 0;
    if (txt_fullName.text.length == 0) {
        lbl_Namerequired.hidden = NO;
        [view_name setBackgroundColor:[UIColor redColor]];
        chekr = 1;
    }
    else{
        lbl_Namerequired.hidden = YES;
        [view_name setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    if (txt_gender.text.length == 0 ) {
        lbl_GenderRequired.hidden = NO;
        [view_gender setBackgroundColor:[UIColor redColor]];
        chekr = 1;
    }
    else{
        lbl_GenderRequired.hidden = YES;
        [view_gender setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    if (txt_dob.text.length == 0) {
        lbl_DobRequired.hidden = NO;
        [view_dob setBackgroundColor:[UIColor redColor]];
        chekr = 1;
    }
    else{
        lbl_DobRequired.hidden = YES;
        [view_dob setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    
    if (txt_dob.text.length > 0 && txt_fullName.text.length > 0 && txt_gender.text.length > 0)
    {
       if (![txt_gender.text isEqualToString:@"Select Gender"])
       {
           [button_submitProp setTitle:@"" forState:UIControlStateNormal];
           [UIView animateWithDuration:0.30 animations:^{
               button_submitProp.frame = CGRectMake((self.view.frame.size.width/2)-20 , button_submitProp.frame.origin.y ,40, button_submitProp.frame.size.height);
               button_submitProp.transform = CGAffineTransformMakeScale(1.0, 1.0);
           }];
           [self performSelector:@selector(animaStart)  withObject:nil afterDelay:0.30];
           [self performSelector:@selector(SubmitClicked)  withObject:nil afterDelay:1.0];
       }
       else{
           lbl_GenderRequired.hidden = NO;
           [view_gender setBackgroundColor:[UIColor redColor]];
           chekr = 1;
           }
    }
    
    
}
-(void)animaStart{
    [indicator_View startAnimating];
}
-(void)SubmitClicked
{
    //Set date format according to web service
    [df setDateFormat:@"dd MMMM yyyy"];
    NSString * datestr = [df stringFromDate:datePicker.date];
    web = [[WebserviceViewController alloc]init];
    [web Registration:@selector(getRegistrationResult:) tempTarget:self :_email :_password :_name :txt_gender.text :datestr :@"":UIImageJPEGRepresentation(img_profileimage.image, 0.1)];
    //HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
-(void)getRegistrationResult:(NSDictionary*)dict_Responce{
    NSLog(@"%@",dict_Responce);
   // [HUD hide:YES];
    if ([dict_Responce isEqual:[NSNull null]]) {
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1) {
            GetStartedViewController * starter = [self.storyboard instantiateViewControllerWithIdentifier:@"GetStartedViewController"];
                [self.navigationController pushViewController:starter animated:YES];
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Registration successfully completed" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
            [indicator_View stopAnimating];
        }
        else{
            [[[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"%@",[[dict_Responce valueForKey:@"response"]valueForKey:@"msg"]] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
//            button_submitProp.frame = CGRectMake(16 , button_submitProp.frame.origin.y ,288, button_submitProp.frame.size.height);
            [self buttonFrame];
            [indicator_View stopAnimating];
        }
    }
}
-(IBAction)hideKey:(id)sender
{
    [self resignFirstResponder];
}
@end
