//
//  screen1.h
//  parse_test
//
//  Created by Saurabh Mishra on 6/19/14.
//  Copyright (c) 2014 iquince. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface screen1 : UIViewController{
    
    
    __weak IBOutlet UITextField *name_text;
    
    __weak IBOutlet UITextField *add_text;
    IBOutlet UIButton *saurabh;
    IBOutlet UIButton *sagar;
    IBOutlet UIButton *manoj;
    IBOutlet UIButton *sunil;
    
    NSString *string;
    IBOutlet UITableView *myTableView;
    
   // NSArray *array;
    NSString *email;
}
@property NSString *email;
@end
