//
//  JFRanking.h
//  JFPingPong
//
//  Created by John Figueiredo on 1/27/14.
//  Copyright (c) 2014 John Figueiredo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class JFUser;

@interface JFRanking : NSManagedObject

@property (nonatomic, retain) NSNumber * rankingID;
@property (nonatomic, retain) NSNumber * rank;
@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) JFUser *user;

@end
