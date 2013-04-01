//
//  SettingsViewController.h
//  MedicalApp
//
//  Created by Vicky Enalen on 2013-03-31.
//  Copyright (c) 2013 Haptic5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
<UITableViewDataSource>

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NSMutableArray *options;

-(IBAction)bloodSugarAlert;
-(IBAction)happinessAlert;
-(IBAction)waterAlert;

@end
