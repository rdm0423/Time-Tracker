//
//  CustomEntryViewController.m
//  Time-Tracker
//
//  Created by Ross McIlwaine on 2/20/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CustomEntryViewController.h"
#import "Entry.h"

@interface CustomEntryViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *startTImeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;

@property (weak, nonatomic) IBOutlet UIDatePicker *startTimePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *endTImePIcker;
@property (weak, nonatomic) IBOutlet UINavigationBar *fakeNavBar;


@end

@implementation CustomEntryViewController

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Registering the picker for the update label methods
    [self.startTimePicker addTarget:self action:@selector(updateStartTimeLabel) forControlEvents:(UIControlEventValueChanged)];
    [self.endTImePIcker addTarget:self action:@selector(updateEndTimeLabel) forControlEvents:(UIControlEventValueChanged)];

    
}

- (void)updateStartTimeLabel {
    self.startTImeLabel.text = [self dateToString:self.startTimePicker.date];
    
}

- (void)updateEndTimeLabel {
    self.endTimeLabel.text = [self dateToString:self.endTImePIcker.date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - navigationBar button actions
// Action for cancel button
- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Action for save button
- (IBAction)saveAction:(id)sender {
    Entry *entry = [Entry new];
    entry.startTime = self.startTimePicker.date;
    entry.endTime = self.endTImePIcker.date;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)dateToString:(NSDate *)date {
    return [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
