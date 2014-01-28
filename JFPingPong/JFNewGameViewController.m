//
//  JFPingPongSecondViewController.m
//  JFPingPong
//
//  Created by John Figueiredo on 1/26/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import "JFNewGameViewController.h"
#import <AFNetworking.h>
#import "JFHTTPClient.h"

static NSString * const kJFUserData = @"user";
static NSString * const kJFLeaderboardURL = @"http://byliner-ping-pong.herokuapp.com/api/v1/leaderboard.json";

@interface JFNewGameViewController ()
@property (copy, nonatomic) NSArray *userArray;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@end

@implementation JFNewGameViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.picker.dataSource = self;
  self.picker.delegate = self;
  self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.384 green:0.608 blue:0.710 alpha:1.0];
}

- (void)viewWillAppear:(BOOL)animated {
  AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
  [manager GET:kJFLeaderboardURL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    self.userArray = responseObject;
    [self.picker reloadAllComponents];
    NSInteger middleCount = self.userArray.count/2;
    [self.picker selectRow:middleCount inComponent:0 animated:YES];
    [self.picker selectRow:middleCount inComponent:1 animated:YES];
    NSLog(@"JSON: %@", self.userArray);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - IBActions
- (IBAction)logGameButtonPressed:(id)sender {
  NSLog(@"Hello World");
}


#pragma mark - PickerView DataSource
- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView {
  return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
  return self.userArray.count;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
  NSString *title = self.userArray[row][@"username"];
  NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
  return attributedString;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
  return [self.userArray objectAtIndex:row];
}

@end
