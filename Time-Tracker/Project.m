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

#pragma mark - add/remove entry
- (void)addEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = [[NSMutableArray alloc] initWithArray:self.entries];
    [mutableEntries addObject:entry];
    self.entries = mutableEntries;
}


- (void)removeEntry:(Entry *)entry {
    
    if (!entry) {
        return;
    }
    
    NSMutableArray *mutableEntries = self.entries.mutableCopy;
    [mutableEntries removeObject:entry];
    self.entries = mutableEntries;
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

- (NSString *)projectTime {
    
    NSInteger totalHours = 0;
    NSInteger totalMinutes = 0;
    
    for (Entry *entry in self.entries) {
        NSTimeInterval distanceBetweenDates = [entry.endTime timeIntervalSinceDate:entry.startTime];
        
        // Find number of hours
        double secondsInAnHour = 3600;
        NSInteger hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
        
        // Subract hours to see how many minutes
        double secondsInAMinute = 60;
        NSInteger minutesBetweenDates = (distanceBetweenDates = (hoursBetweenDates * secondsInAnHour)) / secondsInAMinute;
        
        totalHours += hoursBetweenDates;
        totalMinutes += minutesBetweenDates;
    }
    // If Hour/Minute is less than 10 - add a 0 before it
    NSString *hourString = totalHours < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalHours] : [NSString stringWithFormat:@"%ld", (long)totalHours];
    NSString *minutesString = totalMinutes < 10 ? [NSString stringWithFormat:@"0%ld", (long)totalMinutes] : [NSString stringWithFormat:@"%ld", (long)totalMinutes];
    
    return [NSString stringWithFormat:@"%@:%@", hourString, minutesString];
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

//- (void)setEntries:(NSArray *)entries {
//    self.entries = entries;
//    [self synchronize];
//}


@end
