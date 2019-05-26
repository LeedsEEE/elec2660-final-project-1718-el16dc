//
//  SudokuViewController.h
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
// edit to commit

#import <UIKit/UIKit.h>


@interface SudokuViewController : UIViewController <UITextFieldDelegate>

@property int mode; // carried through segue, used when show/hide buttons

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

- (IBAction)touchOutside:(UIControl *)sender; // used when initialising the text fields

@property (strong, nonatomic) NSMutableArray* textFields; // Array of all text fields
@property NSMutableArray *field;
@property NSMutableArray *sudoku;
@property int shownNumberCount;
@property int numbersToReveal;
@property int displayedNumberCount;

@property (strong, nonatomic) NSMutableArray* SolvedSudoku;

@end
