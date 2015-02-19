//
//  TTListTableViewDataSource.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTListTableViewDataSource.h"
#import "TTProjectController.h"

@interface TTListTableViewDataSource () 

@end

@implementation TTListTableViewDataSource

-(void)registerTableView:(UITableView *)tableView
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[TTProjectController sharedInstance].projects count];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell != nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    TTProject *project = [TTProjectController sharedInstance].projects[indexPath.row];
    
    cell.textLabel.text = project.title;
   // cell.detailTextLabel.text = project.timeStamp;
    
    return cell;
    
}


@end
