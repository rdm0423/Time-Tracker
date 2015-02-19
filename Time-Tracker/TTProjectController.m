//
//  TTProjectController.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTProjectController.h"

static NSString * const projectListKey = @"projectList";

@interface TTProjectController ()

@property (nonatomic, strong) NSArray *projects;

@end


//  sharedInstance, add/remove project, loadFromDefaults, Synchronize
@implementation TTProjectController

+ (TTProjectController *)sharedInstance {
    static TTProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [TTProjectController new];
    });
    return sharedInstance;
}

// Converts
-(void)addProject:(TTProject *)project {
    if (!project){
        return;
    }
    // Create mutable array version of Projects Array Property
    NSMutableArray *mutableProjects = self.projects.mutableCopy;
    [mutableProjects addObject:project];
    
    self.projects = mutableProjects;
    [self storeDefaultsInProjects];
}

-(void)removeProject:(TTProject *)project {
    if (!project){
        return;
    }
    // Create mutable array version of Projects Array Property
    NSMutableArray *mutableProjects = self.projects.mutableCopy;
    [mutableProjects removeObject:project];
    
    self.projects = mutableProjects;
    [self storeDefaultsInProjects];
}


- (void)loadEntriesFromDefaults {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:projectListKey];
    
    NSMutableArray *projects = [NSMutableArray new];
    for (NSDictionary *project in entryDictionaries) {
        [projects addObject:[[TTProject alloc] initWithDictionary:project]];
    }
    self.projects = projects;
}

-(void)storeDefaultsInProjects {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (TTProject *project in self.projects) {
        [entryDictionaries addObject:[project entryDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:projectListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
