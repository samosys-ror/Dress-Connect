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
@synthesize buttonSubmitProp,txt_email,img_indicatorView,view_email,lbl_Emailrequired;
- (void)viewDidLoad {
    [super viewDidLoad];
    txt_email.delegate = self;
    // Do any additional setup after loading the view.
    buttonSubmitProp.layer.cornerRadius = 19.35;
    const static CGFloat kJVFieldFloatingLabelFontSize = 11.0f;
    txt_email.floatingLabelFont = [UIFont boldSystemFontOfSize:kJVFieldFloatingLabelFontSize];
    indicator_View = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator_View.frame = CGRectMake(img_indicatorView.frame.origin.x,img_indicatorView.frame.origin.y, 45,45);
    [self.view addSubview:indicator_View];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    lbl_Emailrequired.hidden = YES;
    [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
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
    [self.view endEditing:YES];
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    NSString * str = nil;
    int i = 0;

    if (txt_email.text.length ==0) {
        lbl_Emailrequired.hidden = NO;
        [view_email setBackgroundColor:[UIColor redColor]];
        i = 1;
 
    }
    else{
        lbl_Emailrequired.hidden = YES;
        [view_email setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    }
    if ([emailTest evaluateWithObject:txt_email.text] == NO && txt_email.text.length) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter a Valid Email id" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (i == 0)
    {
        //do action
        //for indicator view
        buttonSubmitProp.hidden = YES;
        img_indicatorView.hidden = NO;
        [indicator_View startAnimating];
        [self performSelector:@selector(SubmitClicked)  withObject:nil afterDelay:1.0];
        
   
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
