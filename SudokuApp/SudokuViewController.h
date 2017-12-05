//
//  SudokuViewController.h
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
// edit to commit

#import <UIKit/UIKit.h>
#import "Sudoku.h"
//#import "DownPicker.h"//
#import "Sudoku.h"
// Found from https://cocoapods.org/?q=lang%3Aobjc%20Downpicker

@interface SudokuViewController : UIViewController <UITextFieldDelegate>

//@property (strong, nonatomic) DownPicker *downPicker1;

@property int mode; // carried through segu, used when show/hide buttons

// Declare button outlet, so can show/hide when needed
// Moved down on screen to be fully hidden by keypad when it pops up
@property (weak, nonatomic) IBOutlet UIButton *OutletHintButton;
@property (weak, nonatomic) IBOutlet UIButton *OutletCheckButton;
@property (weak, nonatomic) IBOutlet UIButton *OutletSolveButton;

@property(nonatomic) UIReturnKeyType returnKeyType;

// Declare Buttons
- (IBAction)ActionHintButton:(UIButton *)sender;
- (IBAction)ActionCheckButton:(UIButton *)sender;
- (IBAction)ActionSolveButton:(UIButton *)sender;



- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string;

@property int row;
@property int column;
@property int group;
@property int value;

@property BOOL solved;

// Setting up all textFields row by row.
// Named using coordinate system, top left = (1,1) bottom right = (9,9)



//@property (strong, nonatomic) DownPicker *downPicker;


- (IBAction)touchOutside:(UIControl *)sender; // used when initialising the text fields

//- (IBAction)numberEntered:(UITextField *)sender; // used when storing numbers in textField

@property (strong, nonatomic) NSMutableArray* textFields; // Array of all text fields
@property NSMutableArray *field;
@property NSMutableArray *sudoku;
@property int shownNumberCount;

@property (strong, nonatomic) NSMutableArray* SolvedSudoku;

@end
