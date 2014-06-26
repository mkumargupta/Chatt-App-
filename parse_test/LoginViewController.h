//
//  LoginViewController.h
//  parse_test
//
//  Created by iQuinceSoft on 6/20/14.
//  Copyright (c) 2014 iquince. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "screen1.h"

@interface LoginViewController : UIViewController
{
    
    IBOutlet UITextField *nameTxt;
    IBOutlet UITextField *passTxt;
}
- (IBAction)loginAction:(id)sender;
- (IBAction)signUpAction:(id)sender;

@end
