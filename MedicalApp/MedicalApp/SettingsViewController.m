//
//  SettingsViewController.m
//  MedicalApp
//
//  Created by Vicky Enalen on 2013-03-31.
//  Copyright (c) 2013 Haptic5. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize table;


-(IBAction)bloodSugarAlert {
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 160)];
    UIAlertView *bloodSugarAlert = [[UIAlertView alloc] initWithTitle:@"Blood Sugar Options" message:@"\n\n\n\n\n\n\n\n Choose your settings for this category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    [bloodSugarAlert addSubview:table];
    [bloodSugarAlert show];
}

-(IBAction)happinessAlert {
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 160)];
    UIAlertView *happinessAlert = [[UIAlertView alloc] initWithTitle:@"Happiness Options" message:@"\n\n\n\n\n\n\n\n Choose your settings for this category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    [happinessAlert addSubview:table];
    [happinessAlert show];
}

-(IBAction)waterAlert{
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 160)];
    UIAlertView *waterAlert = [[UIAlertView alloc] initWithTitle:@"Glasses of Water Options" message:@"\n\n\n\n\n\n\n\n Choose your settings for this category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    [waterAlert addSubview:table];
    [waterAlert show];
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
