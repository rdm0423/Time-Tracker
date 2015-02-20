//
//  TTProject.h
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *timeStamp;
@property (nonatomic, strong) NSString *text;

@property (nonatomic,strong) NSArray *entries;

-(NSDictionary *)entryDictionary;
-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
