//
//  TempViewController.m
//  TempConverter
//
//  Created by fxie on 1/18/14.
//  Copyright (c) 2014 fxie. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

- (void)updateValues;
- (void)onDoneButton;

@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tempTextField.delegate = self;
    
    [self.unitControl addTarget:self action:@selector(updateValues) forControlEvents:UIControlEventValueChanged];
    self.tempTextField.text = @"32";
    self.unitControl.selectedSegmentIndex = 1;
    [self updateValues];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    [self updateValues];
    
    return YES;
}

#pragma mark - Private methods

- (void)onDoneButton {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    int isFahrenheit = self.unitControl.selectedSegmentIndex;
    float originalTemp = [self.tempTextField.text floatValue];
    float convertedTemp;
    NSString *convertedUnit;
    if (isFahrenheit){
        // Convert from Fahrenheit to Celcius
        convertedTemp = (originalTemp - 32) * 0.55556;
        convertedUnit = @"Celcius";
    }
    else{
        // Convert from Celcius to Fahrenheit
        convertedTemp = (originalTemp * 1.8) + 32;
        convertedUnit = @"Fahrenheit";

    }

    self.tempLabel.text = [NSString stringWithFormat:@"%0.5f", convertedTemp];
    self.unitLabel.text = convertedUnit;
    
}

@end
