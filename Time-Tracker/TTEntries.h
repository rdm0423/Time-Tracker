//
//  TTEntries.h
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTEntries : NSObject

@property (nonatomic,strong) NSDate *startTime;
@property (nonatomic,strong) NSDate *endTime;


-(NSDictionary *)entryDictionary;
-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
