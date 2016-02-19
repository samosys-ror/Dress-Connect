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
}

@end

@implementation LoginViewController
@synthesize txt_Loginemail,txt_loginPassword,loginButtonProp;

- (void)viewDidLoad {
    [super viewDidLoad];
    loginButtonProp.layer.cornerRadius  = 19.35;
    const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;
    txt_Loginemail.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    txt_loginPassword.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];

    
    // Do any additional setup after loading the view.
    // For testing
//    txt_Loginemail.text = @"aaa@gmail.com";
//    txt_loginPassword.text = @"aaa";

    
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
    {
        NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        NSString * str = nil;
        
        if (txt_Loginemail.text.length > 0) {
            if([emailTest evaluateWithObject:txt_Loginemail.text] == YES)
            {
                if (txt_loginPassword.text.length > 0) {
        
                    web = [[WebserviceViewController alloc]init];
                    [web Login:@selector(GetResultofLogin:) tempTarget:self :txt_Loginemail.text :txt_loginPassword.text :@""];
                    HUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
                }
                else
                {
                    
                    str  = @"Please Enter Password";
                }
            }
            else
            {
                str  = @"Please Enter Valid Email Id";
            }
            
        }
        else
        {
            str  = @"Please Enter Email Id";
        }
        if (str) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        
   }
}
-(void)GetResultofLogin:(NSDictionary *)dict_Responce{
    NSLog(@"%@",dict_Responce);
    [HUD hide:YES];
    if ([dict_Responce isEqual:[NSNull null]]) {
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1) {
            [[NSUserDefaults standardUserDefaults]setValue:[[[dict_Responce valueForKey:@"response"]valueForKey:@"result"] valueForKey:@"user_id"]forKey:@"userid"];
            HomeViewController * home = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
            [self.navigationController pushViewController:home animated:YES];
            
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Login Successful." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
        }
        else{
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
