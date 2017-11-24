//
//  ViewController.h
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *SudokuApp;
@property (weak, nonatomic) IBOutlet UIPickerView *GameModePicker;

@property int mode; // 


- (IBAction)Go:(UIButton *)sender; //

@end

