//
//  detail.h
//  parse_test
//
//  Created by Saurabh Mishra on 6/20/14.
//  Copyright (c) 2014 iquince. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detail : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    __weak IBOutlet UITableView *mytable;
    
    __weak IBOutlet UITextField *chat;
    NSString *textLoad;
    NSString *firstUser,*sndUser;
    
    NSString *string;
    IBOutlet UILabel *userName;
}
@property NSString *textLoad;

- (IBAction)backAction:(id)sender;

@end
