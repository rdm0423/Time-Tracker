//
//  TTProjectController.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectController.h"

static NSString * const projectListKey = @"projectList";

@interface ProjectController ()

@property (nonatomic, strong) NSArray *projects;

@end


//  sharedInstance, add/remove project, loadFromDefaults, Synchronize
@implementation ProjectController

+ (ProjectController *)sharedInstance {
    static ProjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ProjectController new];
    });
    return sharedInstance;
}

//set Project code - eliminates need for syncronize in add/remove
- (void)setProjects:(NSArray *)projects {
    self.projects = projects;
    [self storeDefaultsInProjects];
}


// Converts
-(void)addProject:(Project *)project {
    if (!project){
        return;
    }
    // Create mutable array version of Projects Array Property
    NSMutableArray *mutableProjects = self.projects.mutableCopy;
    [mutableProjects addObject:project];
    
    self.projects = mutableProjects;
//    [self storeDefaultsInProjects];
}

-(void)removeProject:(Project *)project {
    if (!project){
        return;
    }
    // Create mutable array version of Projects Array Property
    NSMutableArray *mutableProjects = self.projects.mutableCopy;
    [mutableProjects removeObject:project];
    
    self.projects = mutableProjects;
//    [self storeDefaultsInProjects];
}


- (void)loadEntriesFromDefaults {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:projectListKey];
    
    NSMutableArray *projects = [NSMutableArray new];
    for (NSDictionary *project in entryDictionaries) {
        [projects addObject:[[Project alloc] initWithDictionary:project]];
    }
    self.projects = projects;
}

-(void)storeDefaultsInProjects {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Project *project in self.projects) {
        [entryDictionaries addObject:[project entryDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:projectListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
