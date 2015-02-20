//
//  TTEntries.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString *const startKey = @"start";
static NSString *const endKey = @"end";

@implementation Entry

#pragma mark - initWithDictionary
// Converts dictionary keys to Entry object properties
-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self){
        self.startTime = dictionary[startKey];
        self.endTime = dictionary[endKey];
    }
    return self;
}

#pragma mark - entryDictionary
// Converts Entry object to dictionary
-(NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    
    if(self.startTime){
        [entryDictionary setObject:self.startTime forKey:startKey];
    }
    if(self.endTime){
        [entryDictionary setObject:self.endTime forKey:endKey];
    }
    return entryDictionary;
}

@end
