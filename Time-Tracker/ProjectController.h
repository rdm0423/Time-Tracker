//
//  TTProjectController.h
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface ProjectController : NSObject

@property (nonatomic, strong, readonly) NSArray *projects;

+ (ProjectController *)sharedInstance;

-(void)removeProject:(Project *)project;
-(void)addProject:(Project *)project;

-(void)storeDefaultsInProjects;

@end
