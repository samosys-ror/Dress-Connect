//
//  ForgetPasswordViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/15/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "WebserviceViewController.h"
#import "MBProgressHUD.h"
@interface ForgetPasswordViewController (){
    MBProgressHUD *hud;
    UIActivityIndicatorView * indicator_View;
}

@end

@implementation ForgetPasswordViewController
@synthesize buttonSubmitProp,txt_email,img_indicatorView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    buttonSubmitProp.layer.cornerRadius = 19.35;
    indicator_View = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator_View.frame = CGRectMake(img_indicatorView.frame.origin.x,img_indicatorView.frame.origin.y, 60,60);
    [self.view addSubview:indicator_View];
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

- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)buttonSubmit:(id)sender {
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    NSString * str = nil;

    if (txt_email.text.length >0) {
        if ([emailTest evaluateWithObject:txt_email.text] == YES) {
            //do action
            //for indicator view
            buttonSubmitProp.hidden = YES;
            img_indicatorView.hidden = NO;
            [indicator_View startAnimating];
            [self performSelector:@selector(SubmitClicked)  withObject:nil afterDelay:1.0];
        }
        else
        {
            str = @"Please Enter a valid Email Id";

        }
        
    }
    else
    {
        str = @"Please Enter Email Id";
    }
    if (str) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

    }
}
-(void)SubmitClicked
{
    WebserviceViewController *web = [[WebserviceViewController alloc]init];
    [web ForgetPassword:@selector(GetResultofForgetPassword:) tempTarget:self :txt_email.text];
    //hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
-(void)GetResultofForgetPassword:(NSDictionary *)dict_Responce{
    NSLog(@"%@",dict_Responce);
    [hud hide:YES];
    if ([dict_Responce isEqual:[NSNull null]]) {
        [[[UIAlertView alloc]initWithTitle:@"" message:@"Server error" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
    }
    else{
        if ([[[dict_Responce valueForKey:@"response"]valueForKey:@"success"] intValue]==1) {
            [self.navigationController popViewControllerAnimated:YES];
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Your password send to your registered mail." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
            [indicator_View stopAnimating];
        }
        else{
            [[[UIAlertView alloc]initWithTitle:@"" message:@"Email id not exist." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            buttonSubmitProp.hidden = NO;
            img_indicatorView.hidden = YES;
            [indicator_View stopAnimating];
        }
        
    }
}
-(IBAction)hideKey:(id)sender
{
    [self resignFirstResponder];
}
@end
