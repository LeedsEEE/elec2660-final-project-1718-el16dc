//
//  SudokuViewController.h
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
// edit to commit

#import <UIKit/UIKit.h>
#import "Sudoku.h"
#import "DownPicker.h"//
// Found from https://cocoapods.org/?q=lang%3Aobjc%20Downpicker

@interface SudokuViewController : UIViewController <UITextFieldDelegate>

//@property (strong, nonatomic) DownPicker *downPicker1;

@property NSInteger Number1;


@property int mode;

@property (weak, nonatomic) IBOutlet UIButton *OutletHintButton;
@property (weak, nonatomic) IBOutlet UIButton *OutletCheckButton;
@property (weak, nonatomic) IBOutlet UIButton *OutletSolveButton;

- (IBAction)ActionHintButton:(UIButton *)sender;
- (IBAction)ActionCheckButton:(UIButton *)sender;
- (IBAction)ActionSolveButton:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UITextField *textField11;
@property (weak, nonatomic) IBOutlet UITextField *textField12;
@property (weak, nonatomic) IBOutlet UITextField *textField13;
@property (weak, nonatomic) IBOutlet UITextField *textField14;
@property (weak, nonatomic) IBOutlet UITextField *textField15;
@property (weak, nonatomic) IBOutlet UITextField *textField16;
@property (weak, nonatomic) IBOutlet UITextField *textField17;
@property (weak, nonatomic) IBOutlet UITextField *textField18;
@property (weak, nonatomic) IBOutlet UITextField *textField19;

@property (weak, nonatomic) IBOutlet UITextField *textField21;
@property (weak, nonatomic) IBOutlet UITextField *textField22;
@property (weak, nonatomic) IBOutlet UITextField *textField23;
@property (weak, nonatomic) IBOutlet UITextField *textField24;
@property (weak, nonatomic) IBOutlet UITextField *textField25;
@property (weak, nonatomic) IBOutlet UITextField *textField26;
@property (weak, nonatomic) IBOutlet UITextField *textField27;
@property (weak, nonatomic) IBOutlet UITextField *textField28;
@property (weak, nonatomic) IBOutlet UITextField *textField29;

@property (weak, nonatomic) IBOutlet UITextField *textField31;
@property (weak, nonatomic) IBOutlet UITextField *textField32;
@property (weak, nonatomic) IBOutlet UITextField *textField33;
@property (weak, nonatomic) IBOutlet UITextField *textField34;
@property (weak, nonatomic) IBOutlet UITextField *textField35;
@property (weak, nonatomic) IBOutlet UITextField *textField36;
@property (weak, nonatomic) IBOutlet UITextField *textField37;
@property (weak, nonatomic) IBOutlet UITextField *textField38;
@property (weak, nonatomic) IBOutlet UITextField *textField39;

@property (weak, nonatomic) IBOutlet UITextField *textField41;
@property (weak, nonatomic) IBOutlet UITextField *textField42;
@property (weak, nonatomic) IBOutlet UITextField *textField43;
@property (weak, nonatomic) IBOutlet UITextField *textField44;
@property (weak, nonatomic) IBOutlet UITextField *textField45;
@property (weak, nonatomic) IBOutlet UITextField *textField46;
@property (weak, nonatomic) IBOutlet UITextField *textField47;
@property (weak, nonatomic) IBOutlet UITextField *textField48;
@property (weak, nonatomic) IBOutlet UITextField *textField49;

@property (weak, nonatomic) IBOutlet UITextField *textField51;
@property (weak, nonatomic) IBOutlet UITextField *textField52;
@property (weak, nonatomic) IBOutlet UITextField *textField53;
@property (weak, nonatomic) IBOutlet UITextField *textField54;
@property (weak, nonatomic) IBOutlet UITextField *textField55;
@property (weak, nonatomic) IBOutlet UITextField *textField56;
@property (weak, nonatomic) IBOutlet UITextField *textField57;
@property (weak, nonatomic) IBOutlet UITextField *textField58;
@property (weak, nonatomic) IBOutlet UITextField *textField59;

@property (weak, nonatomic) IBOutlet UITextField *textField61;
@property (weak, nonatomic) IBOutlet UITextField *textField62;
@property (weak, nonatomic) IBOutlet UITextField *textField63;
@property (weak, nonatomic) IBOutlet UITextField *textField64;
@property (weak, nonatomic) IBOutlet UITextField *textField65;
@property (weak, nonatomic) IBOutlet UITextField *textField66;
@property (weak, nonatomic) IBOutlet UITextField *textField67;
@property (weak, nonatomic) IBOutlet UITextField *textField68;
@property (weak, nonatomic) IBOutlet UITextField *textField69;

@property (weak, nonatomic) IBOutlet UITextField *textField71;
@property (weak, nonatomic) IBOutlet UITextField *textField72;
@property (weak, nonatomic) IBOutlet UITextField *textField73;
@property (weak, nonatomic) IBOutlet UITextField *textField74;
@property (weak, nonatomic) IBOutlet UITextField *textField75;
@property (weak, nonatomic) IBOutlet UITextField *textField76;
@property (weak, nonatomic) IBOutlet UITextField *textField77;
@property (weak, nonatomic) IBOutlet UITextField *textField78;
@property (weak, nonatomic) IBOutlet UITextField *textField79;

@property (weak, nonatomic) IBOutlet UITextField *textField81;
@property (weak, nonatomic) IBOutlet UITextField *textField82;
@property (weak, nonatomic) IBOutlet UITextField *textField83;
@property (weak, nonatomic) IBOutlet UITextField *textField84;
@property (weak, nonatomic) IBOutlet UITextField *textField85;
@property (weak, nonatomic) IBOutlet UITextField *textField86;
@property (weak, nonatomic) IBOutlet UITextField *textField87;
@property (weak, nonatomic) IBOutlet UITextField *textField88;
@property (weak, nonatomic) IBOutlet UITextField *textField89;

@property (weak, nonatomic) IBOutlet UITextField *textField91;
@property (weak, nonatomic) IBOutlet UITextField *textField92;
@property (weak, nonatomic) IBOutlet UITextField *textField93;
@property (weak, nonatomic) IBOutlet UITextField *textField94;
@property (weak, nonatomic) IBOutlet UITextField *textField95;
@property (weak, nonatomic) IBOutlet UITextField *textField96;
@property (weak, nonatomic) IBOutlet UITextField *textField97;
@property (weak, nonatomic) IBOutlet UITextField *textField98;
@property (weak, nonatomic) IBOutlet UITextField *textField99;



//@property (strong, nonatomic) DownPicker *downPicker;


- (IBAction)touchOutside:(UIControl *)sender;

- (IBAction)numberEntered:(UITextField *)sender;

@property (strong, nonatomic) NSMutableArray* textFields;

@end
