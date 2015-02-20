//
//  TTDetailViewControllerDataSource.h
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Project;

@interface TTDetailViewControllerDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) Project *project;

@end
