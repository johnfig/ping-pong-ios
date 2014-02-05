//
//  JFUserProfileViewController.h
//  JFPingPong
//
//  Created by John Figueiredo on 2/2/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFUserProfileViewController : UIViewController
- (void)setPropertiesForView:(NSDictionary*)userArray;
@property (copy, nonatomic) NSDictionary *userProfile;
@end
