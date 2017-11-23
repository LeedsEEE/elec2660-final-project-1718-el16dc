//
//  SudokuViewController.m
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//

#import "SudokuViewController.h"

@interface SudokuViewController ()

@end

@implementation SudokuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // create the array of data
    NSMutableArray* number1Array = [[NSMutableArray alloc] init];
    
    // add some sample data
    [number1Array addObject:@" "];
    [number1Array addObject:@"1"];
    [number1Array addObject:@"2"];
    [number1Array addObject:@"3"];
    [number1Array addObject:@"4"];
    [number1Array addObject:@"5"];
    [number1Array addObject:@"6"];
    [number1Array addObject:@"7"];
    [number1Array addObject:@"8"];
    [number1Array addObject:@"9"];
    
    // bind yourTextField to DownPicker
    
    self.downPicker1 = [[DownPicker alloc] initWithTextField:self.downPicker1 withData:number1Array];
    
    if (self.mode==1){
        NSLog(@"Game Mode = Easy");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
    }
    else if (self.mode==2){
        NSLog(@"Game Mode = Moderate");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
    }
    if (self.mode==3){
        NSLog(@"Game Mode = Hard");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
    }
    if (self.mode==4){
        NSLog(@"Game Mode = Solver");
        self.OutletHintButton.hidden = YES;
        self.OutletCheckButton.hidden = YES;
        self.OutletSolveButton.hidden = NO;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Hint:(UIButton *)sender {
}

- (IBAction)Check:(UIButton *)sender {
}

- (IBAction)Solve:(UIButton *)sender {
}
- (IBAction)ActionHintButton:(UIButton *)sender {
}

- (IBAction)ActionCheckButton:(UIButton *)sender {
}

- (IBAction)ActionSolveButton:(UIButton *)sender {
}
@end
