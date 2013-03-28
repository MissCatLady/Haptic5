//
//  UserTableViewController.h
//  MedicalApp
//
//  Created by Vicky Enalen on 2013-03-28.
//  Copyright (c) 2013 Haptic5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *users;
@property (nonatomic, strong) NSArray *userKeys;

@end
