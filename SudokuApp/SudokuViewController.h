//
//  SudokuViewController.h
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
// edit to commit

#import <UIKit/UIKit.h>
#import "DownPicker.h"//
// Found from https://cocoapods.org/?q=lang%3Aobjc%20Downpicker

@interface SudokuViewController : UIViewController

@property (strong, nonatomic) DownPicker *downPicker1;

@property NSInteger Number1;


@property int mode;

@property (weak, nonatomic) IBOutlet UIButton *OutletHintButton;
@property (weak, nonatomic) IBOutlet UIButton *OutletCheckButton;
@property (weak, nonatomic) IBOutlet UIButton *OutletSolveButton;

- (IBAction)ActionHintButton:(UIButton *)sender;
- (IBAction)ActionCheckButton:(UIButton *)sender;
- (IBAction)ActionSolveButton:(UIButton *)sender;




@end
