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
@synthesize table, options;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [options count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const SwitchCellID = @"SwitchCell";
    UITableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:SwitchCellID];
    if ([indexPath row] != 0){
    if (aCell == nil) {
        aCell = [[UITableViewCell alloc] init];
        aCell.selectionStyle = UITableViewCellSelectionStyleNone;
        UISwitch *switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
        aCell.accessoryView = switchView;
        [switchView setOn:YES animated:NO];
        [switchView addTarget:self action:@selector(soundSwitched:) forControlEvents:UIControlEventValueChanged];
    }
            NSString *currentOption = [options objectAtIndex:[indexPath row]];
            [[aCell textLabel] setText:currentOption];
    return aCell;
    }
    else{
        if (aCell == nil) {
            aCell = [[UITableViewCell alloc] init];
            aCell.selectionStyle = UITableViewCellSelectionStyleBlue;
            aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        NSString *currentOption = [options objectAtIndex:[indexPath row]];
        [[aCell textLabel] setText:currentOption];
        return aCell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    if ([cellText isEqual:@"Input Method"]) {
        options = [[NSMutableArray alloc]
                   initWithObjects:@"Slider",
                   @"Numerical Stepper",
                   @"Button Selection", nil];
        UIAlertView *subalert = [[UIAlertView alloc] initWithTitle:@"Input Method" message:@"\n\n\n\n\n\n\n\nSelect an input method" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel" , nil];
        UITableView *myView = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 150) style:UITableViewStyleGrouped];
        
        myView.delegate = self;
        myView.dataSource = self;
        myView.backgroundColor = [UIColor clearColor];
        [subalert addSubview:myView];
        [subalert show];
    }
    
}

-(IBAction)bloodSugarAlert {
    options = [[NSMutableArray alloc]
               initWithObjects:@"Input Method",
               @"Another Whatever", nil];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Blood Sugar" message:@"\n\n\n\n\n\n\n\nSelect the preferences for Blood Sugar" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    UITableView *myView = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 150) style:UITableViewStyleGrouped];
    
    myView.delegate = self;
    myView.dataSource = self;
    myView.backgroundColor = [UIColor clearColor];
    [alert addSubview:myView];
    [alert show];
} 

-(IBAction)happinessAlert {
    options = [[NSMutableArray alloc]
               initWithObjects:@"Input Method",
               @"Another Whatever", nil];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Happiness Preferences" message:@"\n\n\n\n\n\n\n\nSelect the preferences for Happiness" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    UITableView *myView = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 150) style:UITableViewStyleGrouped];
    
    myView.delegate = self;
    myView.dataSource = self;
    myView.backgroundColor = [UIColor clearColor];
    [alert addSubview:myView];
    [alert show];
    }

-(IBAction)waterAlert{
    options = [[NSMutableArray alloc]
               initWithObjects:@"Input Method",
               @"Another Whatever", nil];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Glasses of Water Preferences" message:@"\n\n\n\n\n\n\n\nSelect the preferences for Glasses of Water" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    UITableView *myView = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 150) style:UITableViewStyleGrouped];
    
    myView.delegate = self;
    myView.dataSource = self;
    myView.backgroundColor = [UIColor clearColor];
    [alert addSubview:myView];
    [alert show];
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
