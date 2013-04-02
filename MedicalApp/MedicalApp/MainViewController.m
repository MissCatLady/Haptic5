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

CGFloat animatedDistance;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;


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

- (IBAction)TextBegin:(UITextField *)textField {
    CGRect textFieldRect =
    [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];

}

- (IBAction)TextEnd:(UITextField *)textField {
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (IBAction)PasswordBegin:(UITextField *)textField {
    [self TextBegin:textField];
}

- (IBAction)PasswordEnd:(UITextField *)textField {
    [self TextEnd:textField];
}

- (BOOL)PasswordReturn:(UITextField *)textField {
    [self TextReturned:textField];
}

- (IBAction)RePassBegin:(UITextField *)textField {
    [self TextBegin:textField];
}

- (IBAction)RePassEnd:(UITextField *)textField {
    [self TextEnd:textField];
}

- (IBAction)RePassReturn:(UITextField *)textField {
    [self TextReturned:textField];
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
