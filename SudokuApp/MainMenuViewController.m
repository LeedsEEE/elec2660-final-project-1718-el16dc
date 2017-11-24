//
//  ViewController.m
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//

#import "MainMenuViewController.h"
#import "SudokuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.GameModePicker.delegate = self;// sets up picker data
    self.GameModePicker.dataSource = self; // "    "    "   "
    self.mode = 1; // initialises gome mode to be one, so if picker is not changed before starting game, it starts easy mode. As before it would start at null
    NSLog(@"Game Mode = %d", self.mode);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Go:(UIButton *)sender {
    [self performSegueWithIdentifier:@"MenuToGame" sender:self]; // completes segue to next screen on press of "GO"
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1; // Sets Single Column
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 4; // Sets It To 4 Rows
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *name; // Sets Text in Rows
    if (row==0){
        name = @"Easy";
    }
    else if (row==1){
        name = @"Moderate";
    }
    else if (row==2){
        name = @"Hard";
    }
    else if (row==3){
        name = @"Solver";
    }
    return name;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
                    // using the didSelectRow functionsets mode chosen as an integer to call later
    if (row==0){
        self.mode = 1;
    }
    else if (row==1){
        self.mode = 2;
    }
    else if (row==2){
        self.mode = 3;
    }
    else if (row==3){
        self.mode=4;
    }
    NSLog(@"GameMode Selected = %d", self.mode); // just to check it works
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
        SudokuViewController *destination = [segue destinationViewController];
        
        destination.mode = self.mode; // used to send the integer "mode" to next page to determine buttons shown
    
}

@end
