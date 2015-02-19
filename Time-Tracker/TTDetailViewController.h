//
//  TTDetailViewController.h
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTDetailViewControllerDataSource.h"

@class TTProject;

@interface TTDetailViewController : UIViewController

@property (nonatomic, strong) TTProject *project;

@property (nonatomic, strong) TTDetailViewControllerDataSource *detailDataSource;

@end
