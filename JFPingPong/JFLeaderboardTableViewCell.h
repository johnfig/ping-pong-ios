//
//  JFLeaderboardTableViewCell.h
//  JFPingPong
//
//  Created by John Figueiredo on 1/27/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFLeaderboardTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView *image;
@property (nonatomic, strong) IBOutlet UILabel *username;
@property (nonatomic, strong) IBOutlet UILabel *score;
@property (nonatomic, strong) IBOutlet UILabel *ranking;
@end
