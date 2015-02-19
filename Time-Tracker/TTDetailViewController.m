//
//  TTDetailViewController.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/19/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "TTDetailViewController.h"
#import "TTProjectController.h"

@interface TTDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation TTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)addAction:(id)sender {
    
    
}


- (IBAction)checkInAction:(id)sender {
    
    
}

- (IBAction)checkOutAction:(id)sender {
    
    
}

- (IBAction)reportAction:(id)sender {
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    self.project.text = textField.text;
    [[TTProjectController sharedInstance] storeDefaultsInProjects];
    
    return YES;
}

@end
