//
//  TTDetailViewControllerDataSource.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

<<<<<<< HEAD:Time-Tracker/DetailViewDataSource.m
#import "DetailViewDataSource.h"
=======
#import "TTDetailViewControllerDataSource.h"
>>>>>>> 7f99f11a8e32e3d415f7e1ba596a6eb19b8a9747:Time-Tracker/TTDetailViewControllerDataSource.m
#import "ProjectController.h"
#import "Entry.h"


@implementation DetailViewDataSource



#pragma mark - dataSource methods (numOfRows & cellforRowAtIndex)
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.project.entries count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
    
    if (tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"detailCell"];
    }
    
    Entry *entry = [self.project entries][indexPath.row];
    
    tableViewCell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", entry.startTime, entry.endTime];
    
    return tableViewCell;
}


@end
