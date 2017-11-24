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
    //NSMutableArray* number1Array = [[NSMutableArray alloc] init];
    
    // add some sample data
   /* [number1Array addObject:@" "];
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
    
    
    //self.downPicker1 = [[DownPicker alloc] initWithTextField:self.downPicker1 withData:number1Array];
    //self.downPicker = [[DownPicker alloc] initWithTextField:_textField withData:number1Array];
    */
    
    
    NSMutableArray* firstRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField11];
    [firstRow addObject:_textField12];
    [firstRow addObject:_textField13];
    [firstRow addObject:_textField14];
    [firstRow addObject:_textField15];
    [firstRow addObject:_textField16];
    [firstRow addObject:_textField17];
    [firstRow addObject:_textField18];
    [firstRow addObject:_textField19];
    
    NSMutableArray* secondRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField21];
    [firstRow addObject:_textField22];
    [firstRow addObject:_textField23];
    [firstRow addObject:_textField24];
    [firstRow addObject:_textField25];
    [firstRow addObject:_textField26];
    [firstRow addObject:_textField27];
    [firstRow addObject:_textField28];
    [firstRow addObject:_textField29];
    
    NSMutableArray* thirdRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField31];
    [firstRow addObject:_textField32];
    [firstRow addObject:_textField33];
    [firstRow addObject:_textField34];
    [firstRow addObject:_textField35];
    [firstRow addObject:_textField36];
    [firstRow addObject:_textField37];
    [firstRow addObject:_textField38];
    [firstRow addObject:_textField39];
    
    NSMutableArray* fourthRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField41];
    [firstRow addObject:_textField42];
    [firstRow addObject:_textField43];
    [firstRow addObject:_textField44];
    [firstRow addObject:_textField45];
    [firstRow addObject:_textField46];
    [firstRow addObject:_textField47];
    [firstRow addObject:_textField48];
    [firstRow addObject:_textField49];
    
    NSMutableArray* fifthRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField51];
    [firstRow addObject:_textField52];
    [firstRow addObject:_textField53];
    [firstRow addObject:_textField54];
    [firstRow addObject:_textField55];
    [firstRow addObject:_textField56];
    [firstRow addObject:_textField57];
    [firstRow addObject:_textField58];
    [firstRow addObject:_textField59];
    
    NSMutableArray* sixthRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField61];
    [firstRow addObject:_textField62];
    [firstRow addObject:_textField63];
    [firstRow addObject:_textField64];
    [firstRow addObject:_textField65];
    [firstRow addObject:_textField66];
    [firstRow addObject:_textField67];
    [firstRow addObject:_textField68];
    [firstRow addObject:_textField69];
    
    NSMutableArray* seventhRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField71];
    [firstRow addObject:_textField72];
    [firstRow addObject:_textField73];
    [firstRow addObject:_textField74];
    [firstRow addObject:_textField75];
    [firstRow addObject:_textField76];
    [firstRow addObject:_textField77];
    [firstRow addObject:_textField78];
    [firstRow addObject:_textField79];
    
    NSMutableArray* eighthRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField81];
    [firstRow addObject:_textField82];
    [firstRow addObject:_textField83];
    [firstRow addObject:_textField84];
    [firstRow addObject:_textField85];
    [firstRow addObject:_textField86];
    [firstRow addObject:_textField87];
    [firstRow addObject:_textField88];
    [firstRow addObject:_textField89];
    
    NSMutableArray* ninthRow = [[NSMutableArray alloc] init];
    [firstRow addObject:_textField91];
    [firstRow addObject:_textField92];
    [firstRow addObject:_textField93];
    [firstRow addObject:_textField94];
    [firstRow addObject:_textField95];
    [firstRow addObject:_textField96];
    [firstRow addObject:_textField97];
    [firstRow addObject:_textField98];
    [firstRow addObject:_textField99];
    
    _textFields = [[NSMutableArray alloc]init];
    [_textFields addObject:firstRow];
    [_textFields addObject:secondRow];
    [_textFields addObject:thirdRow];
    [_textFields addObject:fourthRow];
    [_textFields addObject:fifthRow];
    [_textFields addObject:sixthRow];
    [_textFields addObject:seventhRow];
    [_textFields addObject:eighthRow];
    [_textFields addObject:ninthRow];
        
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

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES; // forces text field to act/become first responder and then give it up for the next one, whilst the keypad is active (and therefore the text field is selected
}

- (IBAction)ActionHintButton:(UIButton *)sender {
}

- (IBAction)ActionCheckButton:(UIButton *)sender {
}

- (IBAction)ActionSolveButton:(UIButton *)sender {
}
- (IBAction)touchOutside:(UIControl *)sender {
    
    for(int i = 0; i < [_textFields count]; i++){ // i = row, j = column. This goes through all i's
        for(int j = 0; j < [[_textFields objectAtIndex:i] count]; j++){ // this goes through all j's
            UITextField *tempTextField = [[_textFields objectAtIndex:i] objectAtIndex:j]; // sets up temporary save for textField
            if([tempTextField isFirstResponder]){ // checks if first responder, which it always is
                [tempTextField resignFirstResponder];// forces it again to be first responder in order to input the number into the text field once the kepad is dismissed
            }
        }
    }
}

- (IBAction)numberEntered:(UITextField *)sender { // checks length of inputted string
    NSLog(@">>>Text entered: %@", sender.text); // NSLog to see what is entered
    if([sender.text length] > 1){ // as long as longer than one...
        sender.text = [sender.text substringWithRange:NSMakeRange(0, 1)]; // trim streing to only first entered character
    }
    
}
@end
