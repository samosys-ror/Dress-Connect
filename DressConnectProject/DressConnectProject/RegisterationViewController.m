//
//  RegisterationViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/15/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "RegisterationViewController.h"
#import "WebserviceViewController.h"
#import "MBProgressHUD.h"
@interface RegisterationViewController ()
{
    UIActivityIndicatorView * indicator_View;
    WebserviceViewController *web;
    MBProgressHUD *HUD;
}

@end

@implementation RegisterationViewController
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;
@synthesize txt_email,txt_name,txt_password,buttonSubmit,view_email,view_name,view_password,lbl_Emailrequired,lbl_NameRequired,lbl_passwordRequired,img_indicatorView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    txt_email.delegate = self;
    txt_name.delegate = self;
    txt_password.delegate = self;
    buttonSubmit.layer.cornerRadius  = 19.35;
    txt_email.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_name.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_password.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    indicator_View = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator_View.frame = CGRectMake(img_indicatorView.frame.origin.x,img_indicatorView.frame.origin.y, 60,60);
    [self.view addSubview:indicator_View];
}
-(void)viewWillAppear:(BOOL)animated
{
    img_indicatorView.hidden = YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == txt_password) {
        [UIView beginAnimations:@"animate" context:nil];
        [UIView setAnimationDuration:0.35f];
        [UIView setAnimationBeginsFromCurrentState: NO];
        self.view.frame = CGRectMake(self.view.frame.origin.x, -40 , self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
    lbl_Emailrequired.hidden = YES;
    lbl_NameRequired.hidden = YES;
    lbl_passwordRequired.hidden = YES;
    [view_name setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:@"animate" context:nil];
    [UIView setAnimationDuration:0.35f];
    [UIView setAnimationBeginsFromCurrentState: NO];
    self.view.frame = CGRectMake(self.view.frame.origin.x, 0 , self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
//    if (txt_email.text.length > 0) {
//        
//        lbl_Emailrequired.hidden = YES;
//        [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
//        
//        if (txt_name.text.length > 0) {
//            
//            lbl_NameRequired.hidden = YES;
//            [view_name setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
//            if (txt_password.text.length > 0) {
//                
//                lbl_passwordRequired.hidden = YES;
//                [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
//                //Nothing to do
//            }
//            else{
//                lbl_passwordRequired.hidden = NO;
//                [view_password setBackgroundColor:[UIColor redColor]];
//            }
//        }
//        else{
//            lbl_NameRequired.hidden = NO;
//            [view_name setBackgroundColor:[UIColor redColor]];
//        }
//    }
//    else{
//        lbl_Emailrequired.hidden = NO;
//        [view_email setBackgroundColor:[UIColor redColor]];
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)submitbutton:(id)sender
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    int  i = 0;
    
   if (txt_email.text.length== 0) {
        
        lbl_Emailrequired.hidden = NO;
        [view_email setBackgroundColor:[UIColor redColor]];
       i = 1;

    }
   if (txt_name.text.length == 0) {
        
        lbl_NameRequired.hidden = NO;
        [view_name setBackgroundColor:[UIColor redColor]];
       i = 1;
    }
   if (txt_password.text.length == 0) {
        
        lbl_passwordRequired.hidden = NO;
        [view_password setBackgroundColor:[UIColor redColor]];
       i = 1;
    }
    else {
        if ([emailTest evaluateWithObject:txt_email.text] == NO && txt_email.text.length > 0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter a Valid Email id" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else if(i==0){

            lbl_Emailrequired.hidden = YES;
            lbl_NameRequired.hidden = YES;
            lbl_passwordRequired.hidden = YES;
            [view_name setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            //for indicator view
            buttonSubmit.hidden = YES;
            img_indicatorView.hidden = NO;
            [indicator_View startAnimating];
            [self performSelector:@selector(SubmitClicked)  withObject:nil afterDelay:1.0];
        
    }
    }
}

-(void)SubmitClicked{
    web = [[WebserviceViewController alloc]init];
    [web CheckEmail:@selector(checkEmailResult:) tempTarget:self :txt_email.text];
    //HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];

    
}
-(void)checkEmailResult:(NSDictionary *)dict_Responce{
    NSLog(@"%@",dict_Responce);
   // [HUD hide:YES];
    if ([dict_Responce isEqual:[NSNull null]]) {
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==0) {
            
            CompleteProfileViewController * complete = [self.storyboard instantiateViewControllerWithIdentifier:@"CompleteProfileViewController"];
            complete.name= txt_name.text;
            complete.email = txt_email.text;
            complete.password= txt_password.text;
            [self.navigationController pushViewController:complete animated:YES];
            [indicator_View stopAnimating];
            
//            [[[UIAlertView alloc]initWithTitle:@"" message:@"" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
        }
        else{
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Email ID Already Exists" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            buttonSubmit.hidden = NO;
            img_indicatorView.hidden = YES;
            [indicator_View stopAnimating];
            
        }
        
    }
}
-(IBAction)hideKey:(id)sender
{
    [self resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)fbRegisterButton:(id)sender
{
    
}
@end
