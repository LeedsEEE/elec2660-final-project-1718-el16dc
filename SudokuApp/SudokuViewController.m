//
//  SudokuViewController.m
//  SudokuApp
//
//  Created by Daniel Colligan [el16dc] on 20/11/2017.
//  Copyright © 2017 Daniel Colligan [el16dc]. All rights reserved.
//

#import "SudokuViewController.h"
#import "SolverEndViewController.h"


@interface SudokuViewController ()


@end

@implementation SudokuViewController
@synthesize SolvedSudoku;

- (void)viewDidLoad {
    [super viewDidLoad];

    _textFields = [[NSMutableArray alloc]init];

    
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
    
    
    
    
    
 for (int y = 0; y <= 8; y++) {
     NSMutableArray *row = [NSMutableArray array];
     
     
        for (int x = 0; x <= 8; x++) {
            // = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)] found on https://gist.github.com/bsodmike/988751
            
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(startx + x*squareWidth, starty + y*squareHeight, squareWidth, squareHeight)];
            //textField.text=@"X";
            //textField.borderStyle = UITextBorderStyleRoundedRect; just to check

            textField.textAlignment = NSTextAlignmentCenter;
            textField.keyboardType = UIKeyboardTypeNumberPad;
            [textField setFont:[UIFont systemFontOfSize:25]];
            //textField.restorationIdentifier = textField i j;
            //textField.returnKeyType = UIReturnKeyDone;
            textField.delegate = self;
            [row addObject:textField];
            [self.view addSubview:textField];
            
        }
     [_textFields addObject:row];
     
    }
/*
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    */
    _shownNumberCount = 81;
    if (self.mode==1){
        NSLog(@"Game Mode = Easy");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
        _shownNumberCount = 40;
    }
    else if (self.mode==2){
        NSLog(@"Game Mode = Moderate");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
        _shownNumberCount = 30;
    }
    if (self.mode==3){
        NSLog(@"Game Mode = Hard");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
        _shownNumberCount = 20;
    }
    if (self.mode==4){
        NSLog(@"Game Mode = Solver");
        self.OutletHintButton.hidden = YES;
        self.OutletCheckButton.hidden = YES;
        self.OutletSolveButton.hidden = NO;
        _shownNumberCount = 0;
    }
    [self fillEmptyGrid];
    [self generateSudoku];

    NSMutableArray *selectedNumbers = [self GenerateNRandomNumbers:_shownNumberCount];
    for(int i = 0; i < _field.count; i++){
        for(int j = 0; j < [[_field objectAtIndex:i] count]; j++){
            for(int n = 0; n < [selectedNumbers count]; n++){
                if([[selectedNumbers objectAtIndex:n] intValue] == i + j*9){
                    UITextField *currentTextField = [[_textFields objectAtIndex:i] objectAtIndex:j];
                    currentTextField.text = [NSString stringWithFormat:@"%@", [[_field objectAtIndex:i] objectAtIndex:j]];
                    currentTextField.userInteractionEnabled = NO;
                }
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

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    //NSLog(@"%@, %@, %ld", textField.text, string, string.length);
    return !(textField.text.length > 0 && string.length != 0);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"Delegate called tFSR");
    [textField resignFirstResponder];
    return YES; // forces text field to act/become first responder and then give it up for the next one, whilst the keypad is active (and therefore the text field is selected
}

- (IBAction)ActionHintButton:(UIButton *)sender {

    NSMutableArray *numberReveal = [self GenerateNRandomNumbers:1];
   
    for(int i = 0; i < _field.count; i++){
        for(int j = 0; j < [[_field objectAtIndex:i] count]; j++){
            for(int n = 0; n < [numberReveal count]; n++){
                if([[numberReveal objectAtIndex:n] intValue] == i + j*9){
                    UITextField *currentTextField = [[_textFields objectAtIndex:i] objectAtIndex:j];
                    currentTextField.text = [NSString stringWithFormat:@"%@", [[_field objectAtIndex:i] objectAtIndex:j]];
                    currentTextField.userInteractionEnabled = NO;
                }
            }
            
        }
    }
}

- (IBAction)ActionCheckButton:(UIButton *)sender {
    
}

- (IBAction)ActionSolveButton:(UIButton *)sender {
    
    
    // adapted from: https://www.youtube.com/watch?v=ka5jb_4ZBYs
    // create nsmarray called sudoku
    NSMutableArray *sudoku = [NSMutableArray array];
    for(int i = 0; i < 9; i++){
        //create nsmarray called rowTemp
        NSMutableArray *tempRow = [NSMutableArray array];
        [sudoku addObject:tempRow];
        for(int j = 0; j < 9; j++){
            // check if text field has text inside it
            // if yes put that text into the sudoku at [i][j]
            // if no put @"0" in the soduku
            UITextField *textField = [[_textFields objectAtIndex:i] objectAtIndex:j];
            if (textField.text.length > 0) { //https://stackoverflow.com/questions/3173679/objective-c-checking-whether-text-field-is-empty
                sudoku[i][j] = textField.text;
            }
            else{
                sudoku[i][j] = @"0";
            }
        }
    }
    // call solve sudoku and store returned array in solvedSudoku
    
    self.SolvedSudoku = [self SolveThisSudoku:sudoku index:0];
    
    [self performSegueWithIdentifier:@"GameToSolved" sender:self]; // completes segue to next screen on press of "GO"
    
}

- (IBAction)touchOutside:(UIControl *)sender {
    
    NSLog(@"Touch outside");
    for(int i = 0; i < [_textFields count]; i++){ // i = row, j = column. This goes through all i's
        for(int j = 0; j < [[_textFields objectAtIndex:i] count]; j++){ // this goes through all j's
            UITextField *tempTextField = [[_textFields objectAtIndex:i] objectAtIndex:j]; // sets up temporary save for textField
            if([tempTextField isFirstResponder]){ // checks if first responder, which it always is
                [tempTextField resignFirstResponder];// forces it again to be first responder in order to input the number into the text field once the kepad is dismissed
            }
        }
    }
}
/*
- (void)keyboardDidShow: (NSNotification *) notif{
    // Do something here
}

- (void)keyboardDidHide: (NSNotification *) notif{
    // Do something here
}*/



        // generateSudoku method found from: https://stackoverflow.com/questions/8595370/sudoku-generation-in-objective-c
-(void) generateSudoku{
    [self fillEmptyGrid];
    @autoreleasepool {
        int n = 3;
        BOOL flag=NO;
        for (int i = 0; i < n*n; i++) {
            
            for (int j = 0; j < n*n; j++){
                if ([_field[i][j] isEqualToString:@"_"]) {
                    if (![self fileValue:i and:j]) {
                        flag=YES;
                        break;
                    }
                }
                else {
                    continue;
                }
            }
            if (flag) {
                break;
            }
        }
        
        if (flag) {
            [self generateSudoku];
        }
        else {
            //NSLog(@"field fill =%@",_field);
        }
    }
}
-(void)fillEmptyGrid{
    int n = 3;
    _field=[[NSMutableArray alloc]init];
    for (int i = 0; i < n*n; i++) {
        NSMutableArray *a=[[NSMutableArray alloc]init];
        [_field addObject:a];
        for (int j = 0; j < n*n; j++){
            [_field[i] addObject:[NSString stringWithFormat:@"_"]];
            
        }
    }
}
-(BOOL)fileValue:(int)i and:(int)j{
    NSMutableArray *rawArray=_field[i];
    NSMutableArray *cellArray=[self boxArray:i and:j];
    NSMutableArray *columnArray=[self colArray:i and:j];
    NSString *value =[self getRandomCol:columnArray rowA:rawArray box:cellArray];
    if (value==nil) {
        return NO;
    }else{
        _field[i][j]=value;
        return YES;
    }
    
}

-(NSMutableArray *)boxArray:(int)i and:(int)j {
    int x= (i<3)?0:((i<6)?3:6);
    int y=(j<3)?0:((j<6)?3:6);
    
    NSMutableArray *ar=[[NSMutableArray alloc]init];
    
    for (int a=x; a<x+3; a++) {
        for (int b=y; b<y+3; b++) {
            [ar addObject:_field[a][b]];
        }
    }
    return ar;
}
-(NSMutableArray *)colArray:(int)i and:(int)j{
    NSMutableArray *ar=[[NSMutableArray alloc]init];
    for (int b=0; b<9; b++) {
        [ar addObject:_field[b][j]];
    }
    return ar;
}

-(NSMutableArray*)GenerateNRandomNumbers:(int)n{
    NSMutableArray *array = [NSMutableArray array];
    for(int i = 0; i < n; i++){
        [array addObject:[NSString stringWithFormat:@"%d", [self GenerateNumberNotInArray:array]]];      //using nsstring as a container
    }
    return array;
    
}

-(int)GenerateNumberNotInArray:(NSMutableArray*) array{
    int r = arc4random() % 81;
    for(int i = 0; i < array.count; i++){
        int currentNumber = [[array objectAtIndex:i] intValue];
        if(currentNumber == r){
            r = [self GenerateNumberNotInArray:array];
        }
    }
    return r;
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

-(NSMutableArray*)SolveThisSudoku:(NSMutableArray*)sudoku index:(int)index{
    
    _solved = (index > 80);
    if (_solved) return sudoku;
    
    int row = index / 9;
    int column = index % 9;
    int box = (row / 3) % 3 + (column / 3) * 3;
    int thisValue = [[[sudoku objectAtIndex:row] objectAtIndex:column] intValue];
    
    if (thisValue != 0) {
        sudoku = [self SolveThisSudoku:sudoku index:index+1];
        if (_solved) return sudoku;
    }
    else {
        for (int test_num = 1; test_num < 10; test_num++) {
            if (![self IsThereA:test_num inBox:box inSudoku:sudoku] && ![self IsThereA:test_num inRow:row inSudoku:sudoku] && ![self IsThereA:test_num inColumn:column inSudoku:sudoku]){
                [[sudoku objectAtIndex:row] setObject:[NSString stringWithFormat:@"%d", test_num] atIndex:column];
                sudoku = [self SolveThisSudoku:sudoku index:index+1];
                if (_solved) return sudoku;
                //SolvedSudoku = sudoku;
            }
        }
        [[sudoku objectAtIndex:row] setObject:@"0" atIndex:column];
    }
    
    return sudoku;
}

-(BOOL)IsThereA:(int)n inRow:(int)row inSudoku:(NSMutableArray*)sudoku{
    for(int i = 0; i < 9; i++) {
        if([[[sudoku objectAtIndex:row] objectAtIndex:i] intValue] == n){
            return YES;
        }
    }
    return NO;
}

-(BOOL)IsThereA:(int)n inColumn:(int)column inSudoku:(NSMutableArray*)sudoku{
    for(int i = 0; i < 9; i++) {
        if([[[sudoku objectAtIndex:i] objectAtIndex:column] intValue] == n){
            return YES;
        }
    }
    return NO;
}

-(BOOL)IsThereA:(int)n inBox:(int)Box inSudoku:(NSMutableArray*)sudoku{
    int column_offset = 3 * (Box / 3);
    int row_offset = 3 * (Box % 3);
    for(int i = 0; i < 9; i++){
        int column = column_offset + i / 3;
        int row = row_offset + i % 3;
        if([[[sudoku objectAtIndex:row] objectAtIndex:column] intValue] == n){
            return YES;
        }
    }
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"GameToSolved"]){
        SolverEndViewController *tvc = segue.destinationViewController;
        NSLog(@">> solved sudoku segued: %@", self.SolvedSudoku);
        tvc.SolvedSudoku = self.SolvedSudoku;
        
    }
    
    
}


    @end


