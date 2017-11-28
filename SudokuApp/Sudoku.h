//
//  Sudoku.h
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Sudoku : NSObject

@property NSMutableArray* sudoku;

@property NSInteger Number11;
@property NSInteger Number12;
@property NSInteger Number13;
@property NSInteger Number14;
@property NSInteger Number15;
@property NSInteger Number16;
@property NSInteger Number17;
@property NSInteger Number18;
@property NSInteger Number19;
@property NSInteger Number21;
@property NSInteger Number22;
@property NSInteger Number23;
@property NSInteger Number24;
@property NSInteger Number25;
@property NSInteger Number26;
@property NSInteger Number27;

- (void) generateSudoku;

@end
