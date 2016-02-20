//
//  LoginViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/15/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "LoginViewController.h"
#import "WebserviceViewController.h"
#import "MBProgressHUD.h"

@interface LoginViewController (){
    WebserviceViewController *web;
    MBProgressHUD *HUD;
    UIActivityIndicatorView * indicator_View;
}

@end

@implementation LoginViewController
@synthesize txt_Loginemail,txt_loginPassword,loginButtonProp,img_indicatorView,view_email,view_password,lbl_Emailrequired,lbl_passwordRequired;

- (void)viewDidLoad {
    [super viewDidLoad];
    loginButtonProp.layer.cornerRadius  = 19.35;
    const static CGFloat kJVFieldFloatingLabelFontSize = 10.0f;
    txt_Loginemail.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_loginPassword.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_Loginemail.delegate = self;
    txt_loginPassword.delegate = self;
    
    // Do any additional setup after loading the view.
    // For testing
//    txt_Loginemail.text = @"vvv@gmail.com";
//    txt_loginPassword.text = @"vvv";
    
    indicator_View = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator_View.frame = CGRectMake(img_indicatorView.frame.origin.x,img_indicatorView.frame.origin.y, 45,45);
    [self.view addSubview:indicator_View];

    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    lbl_Emailrequired.hidden = YES;
    lbl_passwordRequired.hidden = YES;
    [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

-(void)viewWillAppear:(BOOL)animated
{
    img_indicatorView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(IBAction)fbLoginButton:(id)sender
{
    
}
- (IBAction)backButton:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)hideKey:(id)sender
{
    [self resignFirstResponder];
}
-(IBAction)loginButton:(id)sender
{
    int i = 0;
    [self.view endEditing:YES];
        NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    if (txt_Loginemail.text.length == 0) {
        
        lbl_Emailrequired.hidden = NO;
        [view_email setBackgroundColor:[UIColor redColor]];
        i = 1;
    }
    else{
        lbl_Emailrequired.hidden = YES;
        [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
     if(txt_loginPassword.text.length == 0)
    {
        lbl_passwordRequired.hidden = NO;
        [view_password setBackgroundColor:[UIColor redColor]];
        i = 1;
 
    }
     else{
         lbl_passwordRequired.hidden = YES;
         [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
     }
     if([emailTest evaluateWithObject:txt_Loginemail.text] == NO && txt_Loginemail.text.length > 0 && txt_loginPassword.text.length > 0) {
         i = 1;
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter a Valid Email id" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else if (i == 0)
        {
            loginButtonProp.hidden = YES;
            img_indicatorView.hidden = NO;
            [indicator_View startAnimating];
            [self performSelector:@selector(LoginClicked)  withObject:nil afterDelay:1.0];
        }
    
    
    
    
    
}
-(void)LoginClicked
{
    [self resignFirstResponder];
    web = [[WebserviceViewController alloc]init];
    [web Login:@selector(GetResultofLogin:) tempTarget:self :txt_Loginemail.text :txt_loginPassword.text :@""];
    //HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
-(void)GetResultofLogin:(NSDictionary *)dict_Responce{
    NSLog(@"%@",dict_Responce);
   // [HUD hide:YES];
    if ([dict_Responce isEqual:[NSNull null]]) {
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1) {
            [[NSUserDefaults standardUserDefaults]setValue:[[[dict_Responce valueForKey:@"response"]valueForKey:@"result"] valueForKey:@"user_id"]forKey:@"userid"];
            HomeViewController * home = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
            [self.navigationController pushViewController:home animated:YES];
            
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Login Successful." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
            [indicator_View stopAnimating];
        }
        else{
            loginButtonProp.hidden = NO;
            img_indicatorView.hidden = YES;
            [indicator_View stopAnimating];
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Username or password is wrong" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        }
        
    }
}
-(IBAction)ButtonforgotPassword:(id)sender
{
    ForgetPasswordViewController  * fget = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgetPasswordViewController"];
    [self.navigationController pushViewController:fget animated:YES];
    
}
@end
