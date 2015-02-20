//
//  TTProjectViewController.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectViewDataSource.h"
#import "DetailViewController.h"
#import "ProjectController.h"
#import "Project.h"

@interface ProjectViewController () <UITableViewDelegate>

@property (nonatomic, strong) ProjectViewDataSource *dataSource;
@property (nonatomic, strong) UITableView *tableView;

@end

// View Controller containing project instances
@implementation ProjectViewController

- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        self.dataSource = [ProjectViewDataSource new];
    }
    return self;
    
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self.dataSource;
    
    [self.dataSource registerTableView:self.tableView];
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(newProject)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (void)newProject {
    
    Project *project = [Project new];
    [[ProjectController sharedInstance] addProject:project];
    
    DetailViewController *detailViewController = [DetailViewController new];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

// When project is selected, pushes to DetailViewController
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Project *project = [ProjectController sharedInstance].projects[indexPath.row];
    
    DetailViewController *viewController = [DetailViewController new];
    viewController.project = project;
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
