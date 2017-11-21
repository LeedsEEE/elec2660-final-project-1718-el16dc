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
    NSMutableArray* bandArray = [[NSMutableArray alloc] init];
    
    // add some sample data
    [bandArray addObject:@" "];
    [bandArray addObject:@"1"];
    [bandArray addObject:@"2"];
    [bandArray addObject:@"3"];
    [bandArray addObject:@"4"];
    [bandArray addObject:@"5"];
    [bandArray addObject:@"6"];
    [bandArray addObject:@"7"];
    [bandArray addObject:@"8"];
    [bandArray addObject:@"9"];
    
    // bind yourTextField to DownPicker
    
    self.downPicker1 = [[DownPicker alloc] initWithTextField:self.downPicker1 withData:bandArray];
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

@end
