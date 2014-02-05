//
//  JFUserProfileViewController.m
//  JFPingPong
//
//  Created by John Figueiredo on 2/2/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "JFUserProfileViewController.h"
#import "JFLeaderboardViewController.h"
#import <UIImageView+WebCache.h>

@interface JFUserProfileViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *image;
@property (nonatomic, weak) IBOutlet UILabel *username;
@property (nonatomic, weak) IBOutlet UILabel *score;
@property (nonatomic, weak) IBOutlet UILabel *ranking;
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@end

@implementation JFUserProfileViewController

- (id)initWithCoder:(NSCoder*)aDecoder
{
  if(self = [super initWithCoder:aDecoder]) {

  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setPropertiesForView:self.userProfile];
  self.navigationItem.title = self.userProfile[@"username"];
  UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
                              initWithTitle:@"Back"
                              style:UIBarButtonItemStyleBordered
                              target:self
                              action:nil];
  self.navigationController.navigationBar.topItem.backBarButtonItem=btnBack;
}
  
  
- (void)setPropertiesForView:(NSDictionary*)userArray {
  NSURL *imageURL = [NSURL URLWithString:userArray[@"photo"]];
  self.fullName.text = [NSString stringWithFormat:@"%@ %@", userArray[@"first_name"], userArray[@"last_name"]];
  self.username.text = userArray[@"username"];
  self.ranking.text = [userArray[@"ranking"][@"ranking"] stringValue];
  self.score.text = [userArray[@"ranking"][@"score"] stringValue];
  [self.image setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"profile-filler"]];
}
@end
