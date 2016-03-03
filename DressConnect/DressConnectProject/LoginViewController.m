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
    int i,j,k,l;
}

@end

@implementation LoginViewController
@synthesize txt_Loginemail,txt_loginPassword,loginButtonProp,view_email,view_password,lbl_Emailrequired,lbl_passwordRequired;
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
    txt_Loginemail.text = @"dress@gmail.com";
    txt_loginPassword.text = @"123";
    
    indicator_View = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicator_View.frame = CGRectMake((self.view.frame.size.width/2)-20,loginButtonProp.frame.origin.y, 40,40);
    [self.view addSubview:indicator_View];
    i =loginButtonProp.frame.origin.x;
    j =loginButtonProp.frame.origin.y;
    k = loginButtonProp.frame.size.width;
    l = loginButtonProp.frame.size.height;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    lbl_Emailrequired.hidden = YES;
    lbl_passwordRequired.hidden = YES;
    [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}
-(void)buttonFrame
{
    loginButtonProp.frame = CGRectMake(i,j,k,l);
    [loginButtonProp setTitle:@"LOGIN" forState:UIControlStateNormal];
    
    loginButtonProp.layer.cornerRadius = 19.35;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"userid"];
    
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
    int checker = 0;
    [self.view endEditing:YES];
        NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    if (txt_Loginemail.text.length == 0) {
        
        lbl_Emailrequired.hidden = NO;
        [view_email setBackgroundColor:[UIColor redColor]];
        checker = 1;
    }
    else{
        lbl_Emailrequired.hidden = YES;
        [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
     if(txt_loginPassword.text.length == 0)
    {
        lbl_passwordRequired.hidden = NO;
        [view_password setBackgroundColor:[UIColor redColor]];
        checker = 1;
 
    }
     else{
         lbl_passwordRequired.hidden = YES;
         [view_password setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
     }
     if([emailTest evaluateWithObject:txt_Loginemail.text] == NO && txt_Loginemail.text.length > 0 && txt_loginPassword.text.length > 0) {
         checker = 1;
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter a Valid Email id" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else if (checker == 0)
        {
            [loginButtonProp setTitle:@"" forState:UIControlStateNormal];
            [UIView animateWithDuration:0.30 animations:^{
                loginButtonProp.frame = CGRectMake((self.view.frame.size.width/2)-20 , loginButtonProp.frame.origin.y ,40, loginButtonProp.frame.size.height);
                loginButtonProp.transform = CGAffineTransformMakeScale(1.0, 1.0);
                }];
            [self performSelector:@selector(animaStart)  withObject:nil afterDelay:0.30];
            [self performSelector:@selector(LoginClicked)  withObject:nil afterDelay:1.0];
        }
}
-(void)animaStart
{
    [indicator_View startAnimating];
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
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1) {
            [[NSUserDefaults standardUserDefaults]setValue:[[[[dict_Responce valueForKey:@"response"]valueForKey:@"result"] valueForKey:@"user_id"] objectAtIndex:0]forKey:@"userid"];
            HomeViewController * home = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
            [self.navigationController pushViewController:home animated:YES];
            
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Login Successful." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
            [indicator_View stopAnimating];
        }
        else{
            [self buttonFrame];
            loginButtonProp.hidden = NO;
            [indicator_View stopAnimating];
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Username or password is wrong" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }
        
    }
}
-(IBAction)ButtonforgotPassword:(id)sender
{
    ForgetPasswordViewController  * fget = [self.storyboard instantiateViewControllerWithIdentifier:@"ForgetPasswordViewController"];
    [self.navigationController pushViewController:fget animated:YES];
    
}
@end
