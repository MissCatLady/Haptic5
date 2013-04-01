//
//  PasswordProtectionViewController.m
//  MedicalApp
//
//  Created by Vicky Enalen on 2013-03-25.
//  Copyright (c) 2013 Haptic5. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(IBAction)passwordAlert {
    UIAlertView *passwordAlert = [[UIAlertView alloc]
                          initWithTitle:@"Log In"
                          message:@"Please enter your Password"
                          delegate:self
                          cancelButtonTitle:@"Log In"
                          otherButtonTitles:@"Cancel", nil];
    
    [passwordAlert setAlertViewStyle:UIAlertViewStyleSecureTextInput];

    [passwordAlert show];
}

-(IBAction)exportAlert {
    UIAlertView *exportAlert = [[UIAlertView alloc]
                                initWithTitle:@"Exporting Data"
                                message:@"Data Successfully Exported!"
                                delegate:self
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil];
    
    [exportAlert show];
    
}
- (BOOL)TextReturned:(UITextField *)sender {
    [sender resignFirstResponder];
    return YES;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
