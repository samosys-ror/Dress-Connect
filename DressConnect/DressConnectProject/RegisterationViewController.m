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
    int i,j,k,l,m;
}

@end

@implementation RegisterationViewController
const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;
@synthesize txt_email,txt_name,txt_password,buttonSubmit,view_email,view_name,view_password,lbl_Emailrequired,lbl_NameRequired,lbl_passwordRequired,viewForScrolling;

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
    indicator_View = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator_View.frame = CGRectMake((viewForScrolling.frame.size.width/2)-20,buttonSubmit.frame.origin.y, 40,40);
    [self.viewForScrolling addSubview:indicator_View];
     i = buttonSubmit.frame.origin.x;
     j = buttonSubmit.frame.origin.y;
     k = buttonSubmit.frame.size.width;
     l = buttonSubmit.frame.size.height;
     m = viewForScrolling.frame.origin.y;
}
-(void)viewWillAppear:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userid"];
}
-(void)buttonFrame
{
    buttonSubmit.frame = CGRectMake(i,j ,k,l);
    [buttonSubmit setTitle:@"SUBMIT" forState:UIControlStateNormal];
    
    buttonSubmit.layer.cornerRadius = 19.35;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == txt_password)
    {
        if (self.view.frame.size.height == 480)
        {
            [UIView beginAnimations:@"animate" context:nil];
            [UIView setAnimationDuration:0.35f];
            [UIView setAnimationBeginsFromCurrentState: NO];
            viewForScrolling.frame = CGRectMake(viewForScrolling.frame.origin.x,20 , self.view.frame.size.width, viewForScrolling.frame.size.height);
            [UIView commitAnimations];
            
  
        }
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
    viewForScrolling.frame = CGRectMake(viewForScrolling.frame.origin.x, m , self.view.frame.size.width, viewForScrolling.frame.size.height);
    [UIView commitAnimations];
    
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
    int  chekr = 0;
    [self.view endEditing:YES];
    
   if (txt_email.text.length== 0) {
        
        lbl_Emailrequired.hidden = NO;
        [view_email setBackgroundColor:[UIColor redColor]];
       chekr = 1;

    }
   else{
       lbl_Emailrequired.hidden = YES;
       [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
   }
   if (txt_name.text.length == 0) {
        
        lbl_NameRequired.hidden = NO;
        [view_name setBackgroundColor:[UIColor redColor]];
       chekr = 1;
    }
   else{
       lbl_NameRequired.hidden = YES;
       [view_name setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
   }
   if (txt_password.text.length == 0) {
        
        lbl_passwordRequired.hidden = NO;
        [view_password setBackgroundColor:[UIColor redColor]];
       chekr = 1;
    }
   else{
       lbl_passwordRequired.hidden = YES;
       [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
   }
    if ([emailTest evaluateWithObject:txt_email.text] == NO && txt_email.text.length > 0 && txt_email.text.length > 0 && txt_name.text.length > 0 && txt_password.text.length > 0) {
        chekr = 1;
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter a Valid Email id" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
    }
    else if(chekr==0){

            lbl_Emailrequired.hidden = YES;
            lbl_NameRequired.hidden = YES;
            lbl_passwordRequired.hidden = YES;
            [view_name setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
            //for button get round
        [buttonSubmit setTitle:@"" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.30 animations:^{
            buttonSubmit.frame = CGRectMake((self.view.frame.size.width/2)-20 , buttonSubmit.frame.origin.y ,40, buttonSubmit.frame.size.height);
            buttonSubmit.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];

        
        [self performSelector:@selector(animaStart)  withObject:nil afterDelay:0.30];
            [self performSelector:@selector(SubmitClicked)  withObject:nil afterDelay:1.0];
    
    }
}
-(void)animaStart{
    [indicator_View startAnimating];
}
-(void)SubmitClicked{
    
    buttonSubmit.hidden = NO;
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
            [self buttonFrame];
            buttonSubmit.hidden = NO;
            [indicator_View stopAnimating];
            
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Email ID Already Exists" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            
            
            
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
