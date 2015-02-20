//
//  TTProject.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Project.h"
#import "Entry.h"
#import "ProjectController.h"

static NSString *const titleKey = @"title";
static NSString *const textKey = @"text";
static NSString *const timeStampKey = @"timeStamp";

@interface Project ()

@property (nonatomic, strong) Entry *currentEntry;

@end

@implementation Project

- (void)addEntry:(Entry *)entry {
    
    
}

- (void)removeEntry:(Entry *)entry {
    
}

#pragma mark - initWithDictionary
// Converts dictionary to Project Object
- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self){
        self.title = dictionary[titleKey];
        self.text = dictionary[textKey];
        self.timeStamp = dictionary[timeStampKey];
    }
    return self;
}

#pragma mark - entryDictionary
// Converts Project object to dictionary form
- (NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    
    if(self.title){
        [entryDictionary setObject:self.title forKey:titleKey];
    }
    if(self.text){
        [entryDictionary setObject:self.text forKey:textKey];
    }
    if(self.timeStamp){
        [entryDictionary setObject:self.timeStamp forKey:timeStampKey];
    }
    return entryDictionary;
}

- (void)startNewEntry {
    
    Entry *newEntry = [Entry new];
    newEntry.startTime = [NSDate date];
    
    self.currentEntry = newEntry;
    
    [self addEntry:newEntry];
    
}

- (void)endCurrentEntry {
    
    self.currentEntry.endTime = [NSDate date];
    
    [self synchronize];
}


- (void)synchronize {
    [[ProjectController sharedInstance] storeDefaultsInProjects];
}


@end
