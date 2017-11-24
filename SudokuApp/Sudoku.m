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
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number11]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number12]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number13]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number14]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number15]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number16]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number17]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number18]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number19]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number21]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number22]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number23]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number24]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number25]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number26]];
        [sudoku addObject:[NSString stringWithFormat:@"%ld",self.Number26]];
        
        NSLog(@"Sudoku Array = %@", sudoku);
        
    }
    return self;
}

@end
