//
//  detail.m
//  parse_test
//
//  Created by Saurabh Mishra on 6/20/14.
//  Copyright (c) 2014 iquince. All rights reserved.
//

#import "detail.h"
#import <Parse/Parse.h>

@interface detail (){
    NSString *uname,*message;
    NSTimer *timer;
    int t;
    
    NSMutableArray *code;
    NSMutableArray *message_array;
}

@end

@implementation detail
@synthesize textLoad;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void) startTimer {
    timer=  [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(tick:)
                                           userInfo:nil
                                            repeats:YES];
}
- (void) tick:(NSTimer *) timer {
    //NSLog(@"second is %d",t);
   
    t++;
    if(t==7){
         NSLog(@"t is %d",t);
        [self fetch];
        t=0;
   // [timer invalidate];
    }
    
}

- (void)viewDidLoad
{
    userName.text=[NSString stringWithFormat:@"%@ with %@",[[NSUserDefaults standardUserDefaults]stringForKey:@"first user"],[[NSUserDefaults standardUserDefaults]stringForKey:@"second user"]];
    
    chat.delegate=self;
    message_array=[[NSMutableArray alloc]init];
    [self startTimer];
    code=[[NSMutableArray alloc]init];
    t=0;
    
    uname=[NSString stringWithFormat:@"%@%@",firstUser,textLoad];
    NSLog(@"hgs %@",uname);
    [self fetch];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)fetch{
   
    
    [code removeAllObjects];
    
    PFQuery *query=[PFQuery queryWithClassName:@"chatt"];
    [query whereKey:@"username" equalTo:textLoad];
    [query findObjectsInBackgroundWithBlock:^(NSArray *message, NSError *error) {
        if(!error){
            
            NSLog(@"feched successfully all objects");
           // NSLog(@"message is %@",message);
            for(PFObject  *object in message){
                 NSLog(@"object is %@",object.objectId);
                [code addObject:[object objectForKey:@"message"]];
               // [self message];
                NSLog(@"code is %@",code);
                [mytable reloadData];
            }
        }
    }];
   
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitt:(id)sender {
    
    
    message=chat.text;
    if(message.length>0){
    PFObject *obj=[PFObject objectWithClassName:@"chatt"];
    obj[@"username"]=textLoad;
    obj[@"message"]=message;
    [obj saveInBackground];
    [self fetch];
    }
    chat.text=nil;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [chat setFrame:CGRectMake(14, 430, 240, 30)];
    [chat resignFirstResponder];
    //[password resignFirstResponder];
    return YES;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // NSLog(@"table view height");
  
        return 90.0;
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"demo count %d",demo.count);
    return [code count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   mytable.separatorColor=[UIColor clearColor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // NSLog(@"table view function");
    static NSString *myIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];
    
    if (cell == nil) {
        
    }
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myIdentifier];
    
    UILabel *l=[[UILabel alloc]initWithFrame:CGRectMake(20, -4, 300, 50)];
    l.text=code[indexPath.row];
    [cell addSubview:l];
    [[cell imageView] setImage:[UIImage imageNamed:@"message-box.png"]];
    
    return cell;
}

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    [chat setFrame:CGRectMake(14, 200, 240, 30)];
    return YES;
}
@end
