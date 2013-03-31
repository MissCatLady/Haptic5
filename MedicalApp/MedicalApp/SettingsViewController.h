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

@end
