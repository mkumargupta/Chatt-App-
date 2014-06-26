//
//  LoginViewController.m
//  parse_test
//
//  Created by iQuinceSoft on 6/20/14.
//  Copyright (c) 2014 iquince. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.title=@"Chatt App";
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    [PFUser logInWithUsernameInBackground:nameTxt.text password:passTxt.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            [[NSUserDefaults standardUserDefaults]setObject:user.email forKey:@"email"];
                                            screen1 *obj=[[screen1 alloc]init];
                                            obj.email=nameTxt.text;
                                            [self presentViewController:obj animated:YES completion:nil];
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];
}

- (IBAction)signUpAction:(id)sender {
    PFUser *user = [PFUser user];
    user.email = [NSString stringWithFormat:@"%@@gmail.com",nameTxt.text];
    user.username = nameTxt.text;
    user.password = passTxt.text;
    [[NSUserDefaults standardUserDefaults]setObject:user.email forKey:@"email"];
    //user.email = @"manojkumargupta30@gmail.com";
    // other fields can be set just like with PFObject
    user[@"phone"] = @"800-602-3598";
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            screen1 *obj=[[screen1 alloc]init];
            obj.email=nameTxt.text;
            [self presentViewController:obj animated:YES completion:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"change id" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alertView show];
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [nameTxt resignFirstResponder];
    [passTxt resignFirstResponder];
    //[password resignFirstResponder];
    return YES;
}
@end
