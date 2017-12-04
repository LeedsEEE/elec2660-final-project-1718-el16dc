//
//  SolverEndViewController.h
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 27/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SolverEndViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray *SolvedSudoku;

- (IBAction)ActionHomeButton:(UIButton *)sender;

@property (strong, nonatomic) NSMutableArray* textFields; // Array of all text fields
@property NSMutableArray *field;

@end
