//
//  UserTableViewController.m
//  MedicalApp
//
//  Created by Vicky Enalen on 2013-03-28.
//  Copyright (c) 2013 Haptic5. All rights reserved.
//

#import "UserTableViewController.h"

@interface UserTableViewController ()

@end

@implementation UserTableViewController
@synthesize users, userKeys;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [users count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:@"cell"];
    
    NSString *currentUserName = [userKeys objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:currentUserName];
    
    return cell;
}

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
    [super viewDidLoad];
	NSString *userFile = [[NSBundle mainBundle]
                          pathForResource:@"userList" ofType:@"plist"];
    
    users = [[NSDictionary alloc] initWithContentsOfFile:userFile];
    userKeys = [users allKeys];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
