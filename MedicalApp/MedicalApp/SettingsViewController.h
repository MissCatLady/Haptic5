//
//  SettingsViewController.h
//  MedicalApp
//
//  Created by Vicky Enalen on 2013-03-31.
//  Copyright (c) 2013 Haptic5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (strong, nonatomic) UITableView *table;

-(IBAction)bloodSugarAlert;
-(IBAction)happinessAlert;
-(IBAction)waterAlert;
@property (strong, nonatomic) NSMutableArray *options;
@property (weak, nonatomic) IBOutlet UILabel *DisplayWater;
@property (weak, nonatomic) IBOutlet UIStepper *PlusMinus;
@property (weak, nonatomic) IBOutlet UILabel *Happiness;
@property (weak, nonatomic) IBOutlet UISegmentedControl *MeasureHappy;

@property (weak, nonatomic) IBOutlet UILabel *GlassesofWater;
@property (weak, nonatomic) IBOutlet UISwitch *BloodSugarSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *HappinessSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *WaterSwitch;

@property (weak, nonatomic) IBOutlet UILabel *BloodSugarLabel;

@property (weak, nonatomic) IBOutlet UITextField *BloodSugarTextField;

@end
