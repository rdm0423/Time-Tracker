//
//  TTProjectController.h
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTProject.h"

@interface TTProjectController : NSObject

@property (nonatomic, strong, readonly) NSArray *projects;

+ (TTProjectController *)sharedInstance;
-(void)removeProject:(TTProject *)project;
-(void)addProject:(TTProject *)project;
-(void)storeDefaultsInProjects;

@end
