//
//  Sudoku.m
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//


#import "Sudoku.h"
#import "SudokuViewController.h"

@implementation Sudoku{
   // NSMutableArray *field;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
       /* // initialise into 9x9 2d array
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
    return self;*/
/*
        // found from: https://stackoverflow.com/questions/8595370/sudoku-generation-in-objective-c
        [self generateSudoku];
    }
    return self;
}

    -(void) generateSudoku{
        [self fillEmptyGrid];
        @autoreleasepool {
            int n = 3;
            BOOL flag=NO;
            for (int i = 0; i < n*n; i++) {
                
                for (int j = 0; j < n*n; j++){
                    if ([field[i][j] isEqualToString:@"_"]) {
                        if (![self fileValue:i and:j]) {
                            flag=YES;
                            break;
                        }
                    }else{
                        continue;
                    }
                }
                if (flag) {
                    break;
                }
            }
            
            if (flag) {
                [self generateSudoku];
            }else{
                NSLog(@"field fill =%@",field);
            }
        }
    }
    -(void)fillEmptyGrid{
        int n = 3;
        field=[[NSMutableArray alloc]init];
        for (int i = 0; i < n*n; i++) {
            NSMutableArray *a=[[NSMutableArray alloc]init];
            [field addObject:a];
            for (int j = 0; j < n*n; j++){
                [field[i] addObject:[NSString stringWithFormat:@"_"]];
            }
        }
    }
    -(BOOL)fileValue:(int)i and:(int)j{
        NSMutableArray *rawArray=field[i];
        NSMutableArray *cellArray=[self boxArray:i and:j];
        NSMutableArray *columnArray=[self colArray:i and:j];
        NSString *value =[self getRandomCol:columnArray rowA:rawArray box:cellArray];
        if (value==nil) {
            return NO;
        }else{
            field[i][j]=value;
            return YES;
        }
        
    }
    
    -(NSMutableArray *)boxArray:(int)i and:(int)j {
        int x= (i<3)?0:((i<6)?3:6);
        int y=(j<3)?0:((j<6)?3:6);
        
        NSMutableArray *ar=[[NSMutableArray alloc]init];
        
        for (int a=x; a<x+3; a++) {
            for (int b=y; b<y+3; b++) {
                [ar addObject:field[a][b]];
            }
        }
        return ar;
    }
    -(NSMutableArray *)colArray:(int)i and:(int)j{
        NSMutableArray *ar=[[NSMutableArray alloc]init];
        for (int b=0; b<9; b++) {
            [ar addObject:field[b][j]];
        }
        return ar;
    }
    
    -(NSString *)getRandomCol:(NSMutableArray *)col rowA:(NSMutableArray *)row box:(NSMutableArray *)box{
        NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
        
        [array removeObjectsInArray:row];
        [array removeObjectsInArray:box];
        [array removeObjectsInArray:col];
        if (array.count>0) {
            int x=arc4random()%array.count;
            return array[x];
        }
        else{
            
            
            return nil;
        }
    }
 */
        
        int row1[9] = {0};
        NSLog(@"Row1 = %i, %i, %i, %i, %i, %i, %i, %i, %i", row1[0], row1[1],  row1[2], row1[3], row1[4], row1[5], row1[6], row1[7], row1[8]);
        
        int i = rand()%9+1; //http://pinkstone.co.uk/how-to-generate-a-random-number-in-ios/
        NSLog(@"Random Number: %i", i);
              for (x=0; x<=8; x++){
            if (row1[x] == i){
                return false
            }
            else return true;
            }
        if (true){
            
        }
        }
        
@end
