//
//  JFLeaderboardViewController.h
//  JFPingPong
//
//  Created by John Figueiredo on 1/26/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFLeaderboardViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (copy, nonatomic) NSArray *userArray;
@end
