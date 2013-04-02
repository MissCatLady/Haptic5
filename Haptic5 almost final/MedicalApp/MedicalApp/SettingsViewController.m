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
@synthesize BloodSugarLabel;
@synthesize BloodSugarTextField;
@synthesize BloodSugarSwitch;
@synthesize DisplayWater;
@synthesize GlassesofWater;
@synthesize HappinessSwitch;
@synthesize WaterSwitch;
@synthesize PlusMinus;
@synthesize options;

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
            //aCell.accessoryType = UITableViewCellAccessoryCheckmark;
            aCell.accessoryView = switchView;
            aCell.textLabel.adjustsFontSizeToFitWidth = YES;
            //aCell.textLabel.font = [UIFont systemFontOfSize:18.0];
            [switchView setOn:YES animated:NO];
            
           // [switchView addTarget:self action:@selector(soundSwitched:) forControlEvents:UIControlEventValueChanged];
            
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
            aCell.textLabel.adjustsFontSizeToFitWidth = YES;
       // UITableViewCellAccessoryCheckmark
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
                   
                   @"Stepper",
                   
                   @"Button Control", nil];
        
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
               
               @"mmol/L (On) or mg/dL (Off)", nil];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Blood Sugar" message:@"\n\n\n\n\n\n\n\nSelect the preferences for Blood Sugar" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    UITableView *myView = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 150) style:UITableViewStyleGrouped];
    
    
    
    myView.delegate = self;
    
    myView.dataSource = self;
    
    myView.backgroundColor = [UIColor clearColor];
    
    [alert addSubview:myView];
    
    [alert show];
    /*
    table = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 160)];
    UIAlertView *bloodSugarAlert = [[UIAlertView alloc] initWithTitle:@"Blood Sugar Options" message:@"\n\n\n\n\n\n\n\n Choose your settings for this category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    [bloodSugarAlert addSubview:table];
    [bloodSugarAlert show];*/
}

- (IBAction)PlusMinus:(UIStepper *)sender {
    int value = sender.value;
    [DisplayWater setText:[NSString stringWithFormat:@"%d", (int)value]];
}

- (BOOL)BloodSugarReturn:(UITextField *)sender {
    [sender resignFirstResponder];
    return YES;

}


- (IBAction)SetPressed:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    SettingsViewController *newController = (SettingsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    
    [self.navigationController pushViewController:newController animated:YES];
    if (BloodSugarSwitch.isOn){
        //[sender setOn:YES animated:YES];
        [newController.BloodSugarLabel setHidden:NO];
        newController.BloodSugarTextField.hidden = NO;
        //[self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"NO");
        //[sender setOn:NO animated:YES];
       // BloodSugarLabel.hidden = YES;
        //BloodSugarTextField.hidden = YES;
        

        [newController.BloodSugarLabel setHidden:YES];
        newController.BloodSugarTextField.hidden = YES;
        //[self.navigationController popViewControllerAnimated:YES];
    }
    
    if(HappinessSwitch.isOn){
        newController.Happiness.hidden = NO;
        newController.MeasureHappy.hidden = NO;
    }
    else{
        newController.Happiness.hidden = YES;
        newController.MeasureHappy.hidden = YES;
    }

    if(WaterSwitch.isOn){
        [newController.GlassesofWater setHidden:NO];
        newController.DisplayWater.hidden = NO;
        newController.PlusMinus.hidden = NO;
    }
    else{
        [newController.GlassesofWater setHidden:YES];
        newController.DisplayWater.hidden = YES;
        newController.PlusMinus.hidden = YES;
    }
}

- (IBAction)SettingPressed:(UIBarButtonItem *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    SettingsViewController *newController = (SettingsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"SettingPage"];
    [self.navigationController pushViewController:newController animated:YES];
}



-(IBAction)happinessAlert {
    options = [[NSMutableArray alloc]
               
               initWithObjects:@"Input Method",
               
               @"Emoticons", nil];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Happiness Preferences" message:@"\n\n\n\n\n\n\n\nSelect the preferences for Happiness" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    UITableView *myView = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 150) style:UITableViewStyleGrouped];
    
    
    
    myView.delegate = self;
    
    myView.dataSource = self;
    
    myView.backgroundColor = [UIColor clearColor];
    
    [alert addSubview:myView];
    
    [alert show];
    

    /*
    table = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 160)];
    UIAlertView *happinessAlert = [[UIAlertView alloc] initWithTitle:@"Happiness Options" message:@"\n\n\n\n\n\n\n\n Choose your settings for this category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    [happinessAlert addSubview:table];
    [happinessAlert show];*/
}
- (IBAction)SavePressed:(UIButton *)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    SettingsViewController *newController = (SettingsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"MainPage"];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Entry Saved" message:@"" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
    [self.navigationController pushViewController:newController animated:YES];

}

-(IBAction)waterAlert{
    options = [[NSMutableArray alloc]
               
               initWithObjects:@"Input Method",
               
               @"Cups (On) or mL (Off)", nil];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Glasses of Water Preferences" message:@"\n\n\n\n\n\n\n\nSelect the preferences for Glasses of Water" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    UITableView *myView = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 150) style:UITableViewStyleGrouped];
    
    
    
    myView.delegate = self;
    
    myView.dataSource = self;
    
    myView.backgroundColor = [UIColor clearColor];
    
    [alert addSubview:myView];
    
    [alert show];
    /*
    table = [[UITableView alloc] initWithFrame:CGRectMake(10, 40, 264, 160)];
    UIAlertView *waterAlert = [[UIAlertView alloc] initWithTitle:@"Glasses of Water Options" message:@"\n\n\n\n\n\n\n\n Choose your settings for this category" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    
    [waterAlert addSubview:table];
    [waterAlert show];*/
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
