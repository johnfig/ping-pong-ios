//
//  JFUser.h
//  JFPingPong
//
//  Created by John Figueiredo on 1/27/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class JFRanking;

@interface JFUser : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * photo;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) JFRanking *ranking;

@end
