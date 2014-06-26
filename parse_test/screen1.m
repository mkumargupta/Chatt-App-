//
//  screen1.m
//  parse_test
//
//  Created by Saurabh Mishra on 6/19/14.
//  Copyright (c) 2014 iquince. All rights reserved.
//

#import "screen1.h"
#import <Parse/Parse.h>
#import "detail.h"


@interface screen1 (){
    NSString *str1;
    NSString *str2;
    NSMutableArray *cool,*uname;
    NSString *u1,*u2;
    NSString *name;
}

@end

@implementation screen1
@synthesize email;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)user1:(id)sender {
    PFObject *gameScore = [PFObject objectWithClassName:@"table"];
    gameScore[@"user_name"] =[[NSUserDefaults standardUserDefaults]stringForKey:@"email"];
    gameScore[@"sndUser_name"] = [NSString stringWithFormat:@"%@@gmail.com",saurabh.titleLabel.text];
    [gameScore saveInBackground];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@@gmail.com",saurabh.titleLabel.text] forKey:@"snduser"];
    detail *obj=[[detail alloc]initWithNibName:@"detail" bundle:nil];
    obj.textLoad=saurabh.titleLabel.text;
    [self presentViewController:obj animated:YES completion:nil];
    
    
}

- (IBAction)user2:(id)sender {
    PFObject *gameScore = [PFObject objectWithClassName:@"table"];
   
    gameScore[@"user_name"] =[[NSUserDefaults standardUserDefaults]stringForKey:@"email"];
    gameScore[@"sndUser_name"] = [NSString stringWithFormat:@"%@@gmail.com",manoj.titleLabel.text];
    [gameScore saveInBackground];
    
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@@gmail.com",saurabh.titleLabel.text] forKey:@"snduser"];
    
    
 //   u2=@"manoj";
 //   [[NSUserDefaults standardUserDefaults]setObject:u2 forKey:@"tname"];
    detail *obj=[[detail alloc]initWithNibName:@"detail" bundle:nil];
    obj.textLoad=manoj.titleLabel.text;
    [self presentViewController:obj animated:YES completion:nil];

}
- (IBAction)muser3:(id)sender {
    detail *obj=[[detail alloc]initWithNibName:@"detail" bundle:nil];
    obj.textLoad=sagar.titleLabel.text;
    [self presentViewController:obj animated:YES completion:nil];
}
- (IBAction)muser4:(id)sender {
    detail *obj=[[detail alloc]initWithNibName:@"detail" bundle:nil];
    obj.textLoad=sunil.titleLabel.text;
    [self presentViewController:obj animated:YES completion:nil];
}

- (void)viewDidLoad
{
    
    
    uname=[[NSMutableArray alloc]init];
    /*
    PFQuery *obj=[PFQuery queryWithClassName:@"User"];
    [obj selectKeys:@[@"username"]];
    [obj findObjectsInBackgroundWithBlock:^(NSArray *username, NSError *error) {
        NSLog(@"name is %@",username);
        for(PFObject *object in username){
            [self->uname addObject:[object objectForKey:@"username"]];
            
        }
        NSLog(@"uname is %@",uname);
        [myTableView reloadData];
    }];
     */
    PFQuery *query = [PFUser query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded. The first 100 objects are available in objects
         //   NSLog(@"users %@", objects);
            for(PFObject *object in objects){
                if (![email isEqualToString:[object objectForKey:@"username"]]) {
                    [self->uname addObject:[object objectForKey:@"username"]];
                }
                
            }
        } else {
            // Log details of the failure
         //   NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        NSLog(@"user name is %@",uname);
        [myTableView reloadData];
    }];
    string =@"Empty";
    //array =[NSArray arrayWithObjects:@"saurabh",@"sunil",@"sagar",@"sam",@"amit",@"manoj", nil];
    
    cool=[[NSMutableArray alloc]init];
    str1=[[NSString alloc]init];
    str2=[[NSString alloc]init];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {

    str1=name_text.text;
    str2=add_text.text;
    
    PFObject *testObject = [PFObject objectWithClassName:@"user"];
    testObject[@"name"] = str1;
    testObject[@"address"]=str2;
    [testObject saveInBackground];
}
- (IBAction)query:(id)sender {
   
  
    PFQuery *query = [PFQuery queryWithClassName:@"user"];
    [query selectKeys:@[@"name"]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *result, NSError *error) {
      //  NSLog(@"objects %@",result);
        for (PFObject *object in result) {
            [self->cool addObject:[object objectForKey:@"name"]];
        }
       // NSLog(@"cool is %@",cool);// iterate through the objects array, which contains PFObjects for each Student
    }];
     //PFQuery *query = [PFQuery queryWithClassName:@"user"];
   // [query getObjectInBackgroundWithId:@"N69NmiI5Lg" block:^(PFObject *name, NSError *error) {
       //  Do something with the returned PFObject in the gameScore variable.
       // NSLog(@"%@",name);
   // }];
    /*
    PFQuery *query = [PFQuery queryWithClassName:@"user"];
    [query whereKey:@"name" equalTo:@"manoj"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

     */
     }
- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [uname count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *myIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myIdentifier];
    
    if (cell == nil) {
    }
    
    //  cell.backgroundColor = [UIColor yellowColor];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row % 2 ==0) {
        UIImageView *cellImg=[[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, 320, 40)];
        [cellImg setImage:[UIImage imageNamed:@"table-darkGreen.png"]];
        [cell addSubview:cellImg];
    } else {
        UIImageView *cellImg=[[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, 320, 40)];
        [cellImg setImage:[UIImage imageNamed:@"table-lightGreen.png"]];
        [cell addSubview:cellImg];
    }
    cell.textLabel.text=[uname objectAtIndex:indexPath.row];
return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSUserDefaults standardUserDefaults]setObject:email forKey:@"first user"];
    [[NSUserDefaults standardUserDefaults]setObject:[uname objectAtIndex:indexPath.row] forKey:@"second user"];
    
    PFQuery *query=[PFQuery queryWithClassName:@"table"];
    [query whereKey:@"user_name" equalTo:[[NSUserDefaults standardUserDefaults]stringForKey:@"email"]];
    [query whereKey:@"sndUser_name" equalTo:[NSString stringWithFormat:@"%@@gmail.com",[uname objectAtIndex:indexPath.row]]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *message, NSError *error) {
        if(!error){
            
            NSLog(@"AAA feched successfully all objects");
            // NSLog(@"message is %@",message);
            for(PFObject  *object in message){
                NSLog(@"object is %@",object.objectId);
                string=[NSString stringWithFormat:@"%@",object.objectId];
                }
            [self fetchObj];
            NSLog(@"AAAstring %@",string);
            
                if ([string isEqualToString:@"Empty"]) {
                PFQuery *query=[PFQuery queryWithClassName:@"table"];
                [query whereKey:@"user_name" equalTo:[NSString stringWithFormat:@"%@@gmail.com",[uname objectAtIndex:indexPath.row]]];
                [query whereKey:@"sndUser_name" equalTo:[[NSUserDefaults standardUserDefaults]stringForKey:@"email"]];
                [query findObjectsInBackgroundWithBlock:^(NSArray *message, NSError *error) {
                    if(!error){
                        
                        NSLog(@"BBB feched successfully all objects");
                        // NSLog(@"message is %@",message);
                        for(PFObject  *object in message){
                            NSLog(@"object is %@",object.objectId);
                            string=[NSString stringWithFormat:@"%@",object.objectId];
                         }
                        [self fetchObj];
                            NSLog(@"BBBstring %@",string);
                            //[code addObject:[object objectForKey:@"message"]];
                            // [self message];
                            //  NSLog(@"code is %@",code);
                            // [mytable reloadData];
                      if ([string isEqualToString:@"Empty"]) {
                        
                        PFObject *gameScore = [PFObject objectWithClassName:@"table"];
                        
                        gameScore[@"user_name"] =[[NSUserDefaults standardUserDefaults]stringForKey:@"email"];
                        gameScore[@"sndUser_name"] = [NSString stringWithFormat:@"%@@gmail.com",[uname objectAtIndex:indexPath.row]];
                        [gameScore saveInBackground];
                        
                        [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@@gmail.com",saurabh.titleLabel.text] forKey:@"snduser"];
                        
                        PFQuery *query=[PFQuery queryWithClassName:@"table"];
                        [query whereKey:@"user_name" equalTo:[[NSUserDefaults standardUserDefaults]stringForKey:@"email"]];
                        [query whereKey:@"sndUser_name" equalTo:[NSString stringWithFormat:@"%@@gmail.com",[uname objectAtIndex:indexPath.row]]];
                        [query findObjectsInBackgroundWithBlock:^(NSArray *message, NSError *error) {
                             if(!error){
                                
                                NSLog(@"DSXfCGCFG feched successfully all objects");
                                // NSLog(@"message is %@",message);
                                for(PFObject  *object in message){
                                    NSLog(@"object is %@",object.objectId);
                                    string=[NSString stringWithFormat:@"%@",object.objectId];
                                    NSLog(@"CCC %@",string);
                                    //[code addObject:[object objectForKey:@"message"]];
                                    // [self message];
                                    //  NSLog(@"code is %@",code);
                                    // [mytable reloadData];
                                }
                                 [self fetchObj];
                            }
                        }];
                        
                    }
                        }
                }];
            }
            
        }
    }];
   }
-(void)fetchObj
{
    if (![string isEqualToString:@"Empty"]) {
        detail *obj=[[detail alloc]initWithNibName:@"detail" bundle:nil];
        obj.textLoad=string;
        [self presentViewController:obj animated:NO completion:nil];
    }
}

@end
