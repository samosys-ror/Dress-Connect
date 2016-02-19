//
//  ViewController.m
//  DressConnectProject
//
//  Created by samosys on 2/15/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize  buttonLogin,buttonResister;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    buttonLogin.layer.cornerRadius = 19.35;
    buttonResister.layer.cornerRadius  = 19.35;
    buttonResister.clipsToBounds = YES;
    buttonLogin.clipsToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)resisterButton:(id)sender {
    RegisterationViewController  * regis = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterationViewController"];
    [self.navigationController pushViewController:regis animated:YES];
}
- (IBAction)loginButton:(id)sender {
    LoginViewController * login= [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController:login animated:YES];
}
@end
