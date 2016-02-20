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
    [_imageView setFrame:CGRectMake(_imageView.frame.origin.x, _imageView.frame.origin.y-_imageView.frame.size.height, _imageView.frame.size.width, _imageView.frame.size.height)];
    buttonLogin.layer.cornerRadius = 19.35;
    buttonResister.layer.cornerRadius  = 19.35;
    buttonResister.clipsToBounds = YES;
    buttonLogin.clipsToBounds = YES;
    buttonLogin.hidden=YES;
    buttonResister.hidden=YES;
}
-(void)viewWillAppear:(BOOL)animated{
    [UIView animateWithDuration:1.0
                          delay:0.35
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [_imageView setFrame:CGRectMake(_imageView.frame.origin.x, 100, _imageView.frame.size.width, _imageView.frame.size.height)];
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         [self performSelector:@selector(hiddenNo) withObject:nil afterDelay:0.1];
                         
                     }];
}
-(void)hiddenNo{
    buttonLogin.hidden=NO;
    buttonResister.hidden=NO;
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
