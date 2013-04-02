//
//  User.h
//  MedicalApp
//
//  Created by Taylor Dickson on 2013-03-31.
//  Copyright (c) 2013 Haptic5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
{
    NSString* firstname;
    NSString* lastname;
}
//Set Methods
- (void) setFirstname: (NSString*)newFirstname;
- (void) setLastname: (NSString*)newLastname;
//Get Methods
- (NSString*) firstname;
- (NSString*) lastname;
@end
