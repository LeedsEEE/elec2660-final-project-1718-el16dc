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
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number1]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number2]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number3]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number4]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number5]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number6]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number7]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number8]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number9]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number10]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number11]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number12]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number13]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number14]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number15]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number16]];
        
        NSLog(@"Sudoku Array = %@", sudoku);
        
    }
    return self;
}

@end
