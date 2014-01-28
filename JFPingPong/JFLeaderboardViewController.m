//
//  JFPingPongFirstViewController.m
//  JFPingPong
//
//  Created by John Figueiredo on 1/26/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "JFLeaderboardViewController.h"
#import "JFLeaderboardTableViewCell.h"
#import <AFNetworking.h>
#import "JFHTTPClient.h"
#import <UIImageView+WebCache.h>

static NSString * const kJFUserData = @"user";
static NSString * const kJFLeaderboardURL = @"http://byliner-ping-pong.herokuapp.com/api/v1/leaderboard.json";

@interface JFLeaderboardViewController ()
@property (copy, nonatomic) NSArray *userArray;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation JFLeaderboardViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.table.dataSource = self;
  self.table.delegate = self;
  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.384 green:0.608 blue:0.710 alpha:1.0];
  NSDictionary *settings = @{
                             NSFontAttributeName            :  [UIFont fontWithName:@"HelveticaNeue" size:20.0],
                             NSForegroundColorAttributeName :  [UIColor whiteColor]};
  
  [[UINavigationBar appearance] setTitleTextAttributes:settings];
}

- (void)viewWillAppear:(BOOL)animated {
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  [manager GET:kJFLeaderboardURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    self.userArray = responseObject;
    NSLog(@"JSON: %@", self.userArray);
    [self.table reloadData];
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Protocol Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  NSInteger count = self.userArray.count;
  return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  JFLeaderboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFLeaderboardTableViewCell" forIndexPath:indexPath];
  NSURL *imageURL = [NSURL URLWithString:self.userArray[indexPath.row][@"photo"]];
  cell.username.text = self.userArray[indexPath.row][@"username"];
  cell.ranking.text = [self.userArray[indexPath.row][@"ranking"][@"ranking"] stringValue];
  cell.score.text = [self.userArray[indexPath.row][@"ranking"][@"score"] stringValue];
  [cell.image setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"pong-default-image"]];
  return cell;
}

@end
