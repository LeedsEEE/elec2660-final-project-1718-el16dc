//
//  SolverEndViewController.m
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 27/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//

#import "SolverEndViewController.h"
#import "SudokuViewController.h"

@interface SolverEndViewController ()

@end

@implementation SolverEndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

#pragma mark - Initialise TextField Variable
    _textFields = [[NSMutableArray alloc]init];
    
#pragma mark - Text Field Properties
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    NSLog(@"screenWidth = %f", screenWidth);
    NSLog(@"screenHeight = %f", screenHeight);
    
    float borderWidth = ((screenWidth*343)/375);
    float borderHeight = ((screenHeight*603)/667);
    float sudokuHeight = borderWidth;
    float sudokuWidth = borderWidth;
    NSLog(@"borderWidth = %f", borderWidth);
    NSLog(@"SudokuHeight = %f", sudokuHeight);
    NSLog(@"SudokuWidth = %f", sudokuWidth);
    NSLog(@"borderHeight = %f", borderHeight);
    
    float squareHeight = (sudokuHeight/9);
    float squareWidth = (sudokuWidth/9);
    NSLog(@"squareHeight = %f", squareHeight);
    NSLog(@"squareWidth = %f", squareWidth);
    
    float startx = ((screenWidth-sudokuWidth)/2)+1;
    float starty = 64.0;//(screenHeight-borderHeight);
    
    NSLog(@"startx = %f", startx);
    NSLog(@"starty = %f", starty);

#pragma mark - Place Text Fields
    for (int y = 0; y <= 8; y++) {
        NSMutableArray *row = [NSMutableArray array];
        for (int x = 0; x <= 8; x++) {
            // = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)] found on https://gist.github.com/bsodmike/988751
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(startx + x*squareWidth, starty + y*squareHeight, squareWidth, squareHeight)];
            textField.textAlignment = NSTextAlignmentCenter;
            textField.keyboardType = UIKeyboardTypeNumberPad;
            textField.userInteractionEnabled = NO;
            textField.delegate = self;
            [row addObject:textField];
            [self.view addSubview:textField];
        }
        [_textFields addObject:row];
        
    }
#pragma mark - Making User Entered Numbers Appear In Bold
    NSLog(@"%@", _SolvedSudoku);
    for(int i = 0; i < _SolvedSudoku.count; i++){
        for(int j = 0; j < [[_SolvedSudoku objectAtIndex:i] count]; j++){
            for(int n = 0; n < 80; n++){
                NSString *val = [[_SolvedSudoku objectAtIndex:i] objectAtIndex:j];
                UITextField *currentTextField = [[_textFields objectAtIndex:i] objectAtIndex:j];
                if (val.length > 1){
                    // trim last character off
                    
                    [currentTextField setFont:[UIFont fontWithName:@"Arial-BoldMT" size:30]]; // if length > 1, therefore got *, which means was an original number. Put in bold, and remove star. For user clarity
                }
                else {
                    [currentTextField setFont:[UIFont fontWithName:@"Arial" size:28]]; // set rest to be normal
                }
                
                val = [val stringByReplacingOccurrencesOfString:@"*" withString:@""]; // remove star
                
                currentTextField.text = [NSString stringWithFormat:@"%@", val];
                currentTextField.userInteractionEnabled = NO; // blocks user being allowed to edit
            
            }
            
        }
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

#pragma mark - Home Segue
- (IBAction)ActionHomeButton:(UIButton *)sender {
        [self performSegueWithIdentifier:@"SolvedToHome" sender:self]; // segues home
}
@end
