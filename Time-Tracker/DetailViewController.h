//
//  TTDetailViewController.h
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewDataSource.h"

@class Project;

@interface DetailViewController : UIViewController

@property (nonatomic, strong) Project *project;

@property (nonatomic, strong) DetailViewDataSource *detailDataSource;

@end
