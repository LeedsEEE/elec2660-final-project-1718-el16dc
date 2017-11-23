//
//  Sudoku.m
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//

#import "Sudoku.h"
#import "SudokuViewController.h"

@implementation Sudoku

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // initialise into 9x9 2d array
        int sudokuStride=9;
        int sudokuDepth=9;
        
        //set mutable array to be in set dimensions
        NSMutableArray *sudoku = [[NSMutableArray alloc] initWithCapacity:sudokuStride*sudokuDepth];
        
        // add some sample data
        [sudoku addObject: self.Number1];
        [sudoku addObject:@"1"];
        [sudoku addObject:@"2"];
        [sudoku addObject:@"3"];
        [sudoku addObject:@"4"];
        [sudoku addObject:@"5"];
        [sudoku addObject:@"6"];
        [sudoku addObject:@"7"];
        [sudoku addObject:@"8"];
        [sudoku addObject:@"9"];
        
        
    }
    return self;
}

@end
