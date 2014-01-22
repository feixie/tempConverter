//
//  TempViewController.h
//  TempConverter
//
//  Created by fxie on 1/18/14.
//  Copyright (c) 2014 fxie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *tempTextField;
@property (nonatomic, strong) IBOutlet UILabel *tempLabel;
@property (nonatomic, strong) IBOutlet UILabel *unitLabel;
@property (nonatomic, strong) IBOutlet UISegmentedControl *unitControl;

@end
