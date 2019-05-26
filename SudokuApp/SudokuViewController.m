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

#pragma mark - Initialise Properties
    _textFields = [[NSMutableArray alloc]init];
    self.sudoku = [NSMutableArray array];
    _displayedNumberCount = 0;
    
# pragma mark - Setting Up TextFields
    CGRect screenRect = [[UIScreen mainScreen] bounds]; // gets screen boundaries, unique per device. In order to calculte optimum size for text fields
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    NSLog(@"screenWidth = %f", screenWidth);
    NSLog(@"screenHeight = %f", screenHeight);
    
    float borderWidth = ((screenWidth*343)/375); // sets boundaries and therefore size that sudoku can be. Changes per device
    float borderHeight = ((screenHeight*603)/667);
    float sudokuHeight = borderWidth;
    float sudokuWidth = borderWidth;
    NSLog(@"borderWidth = %f", borderWidth);
    NSLog(@"SudokuHeight = %f", sudokuHeight);
    NSLog(@"SudokuWidth = %f", sudokuWidth);
    NSLog(@"borderHeight = %f", borderHeight);
    
    float squareHeight = (sudokuHeight/9); // sets sizes of squares
    float squareWidth = (sudokuWidth/9);
    NSLog(@"squareHeight = %f", squareHeight);
    NSLog(@"squareWidth = %f", squareWidth);
    
    float startx = ((screenWidth-sudokuWidth)/2)+1;
    float starty = 64.0;//(screenHeight-borderHeight);
    
    NSLog(@"startx = %f", startx); // check values
    NSLog(@"starty = %f", starty);
    
#pragma mark - Adding TextFields
    for (int y = 0; y <= 8; y++) {
     NSMutableArray *row = [NSMutableArray array]; // creates row variable filled with 1-9 and makes 9 of them. In order to make 2D array
            for (int x = 0; x <= 8; x++) {
            // = [[UITextField alloc] initWithFrame:CGRectMake(x, y, width, height)] found on https://gist.github.com/bsodmike/988751
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(startx + x*squareWidth, starty + y*squareHeight, squareWidth, squareHeight)];
            textField.textAlignment = NSTextAlignmentCenter;
            textField.keyboardType = UIKeyboardTypeNumberPad;
            [textField setFont:[UIFont fontWithName:@"Arial" size:28]];
            textField.clearsOnBeginEditing = YES;
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

#pragma mark - Initialising Variables
    _shownNumberCount = 81;
    if (self.mode==1){
        NSLog(@"Game Mode = Easy");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
        _shownNumberCount = 50;
        _numbersToReveal = 81 - _shownNumberCount;
    }
    else if (self.mode==2){
        NSLog(@"Game Mode = Moderate");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
        _shownNumberCount = 40;
        _numbersToReveal = 81 - _shownNumberCount;
    }
    if (self.mode==3){
        NSLog(@"Game Mode = Hard");
        self.OutletHintButton.hidden = NO;
        self.OutletCheckButton.hidden = NO;
        self.OutletSolveButton.hidden = YES;
        _shownNumberCount = 30;
        _numbersToReveal = 81 - _shownNumberCount;
    }
    if (self.mode==4){
        NSLog(@"Game Mode = Solver");
        self.OutletHintButton.hidden = YES;
        self.OutletCheckButton.hidden = YES;
        self.OutletSolveButton.hidden = NO;
        _shownNumberCount = 0;
    }
    
#pragma mark - Generate Sudoku
    [self fillEmptyGrid];
    [self generateSudoku];

#pragma mark - Display Numbers In Sudoku
    NSMutableArray *selectedNumbers = [self GenerateNRandomNumbers:_shownNumberCount];
    for(int i = 0; i < _field.count; i++){
        for(int j = 0; j < [[_field objectAtIndex:i] count]; j++){
            for(int n = 0; n < [selectedNumbers count]; n++){
                if([[selectedNumbers objectAtIndex:n] intValue] == i + j*9){
                    UITextField *currentTextField = [[_textFields objectAtIndex:i] objectAtIndex:j];
                    currentTextField.text = [NSString stringWithFormat:@"%@", [[_field objectAtIndex:i] objectAtIndex:j]];
                    currentTextField.userInteractionEnabled = NO; // stops people being able to change correct/programically entered values (genrreate, hint or otherwise)
                    [currentTextField setFont:[UIFont fontWithName:@"Arial-BoldMT" size:30]]; // sets originally entered values (generate) in bold, to highlight user entered values in case incorrect etc
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

#pragma mark - Setting Up Text Field Properties
- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string{
    //NSLog(@"%@, %@, %ld", textField.text, string, string.length);
    return !(textField.text.length > 0 && string.length != 0); // string length can only be 1 in the textfield. so stops keypad input past 1
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"Delegate called tFSR");
    [textField resignFirstResponder];
    return YES; // forces text field to act/become first responder and then give it up for the next one, whilst the keypad is active (and therefore the text field is selected
}

- (IBAction)touchOutside:(UIControl *)sender {
    
    NSLog(@"Touch outside");
    for(int i = 0; i < [_textFields count]; i++){ // i = row, j = column. This goes through all i's
        for(int j = 0; j < [[_textFields objectAtIndex:i] count]; j++){ // this goes through all j's
            UITextField *tempTextField = [[_textFields objectAtIndex:i] objectAtIndex:j]; // sets up temporary save for textField
            if([tempTextField isFirstResponder]){ // checks if first responder, which it always is
                [tempTextField resignFirstResponder]; // closes keypad
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

#pragma mark - Hint Function
- (IBAction)ActionHintButton:(UIButton *)sender {

    [self UpdateSudoku];
    self.SolvedSudoku = [self SolveThisSudoku:self.sudoku index:0];
    NSLog(@"Solved Sudoku = %@", SolvedSudoku);
    self.field = self.SolvedSudoku; // checks if solvable before does hint. Becuase if inputted values break thr rules, it will never find a solution (and return the initialised array of 0's for all empty squares
    
    NSLog(@"Check Sudoku returns %d", [self CheckThisSudoku:_sudoku]);
    
    [ self HighlightIfWrong:self.field]; // gives visual feedback to user as to why it hasnt give a hint
    
    _numbersToReveal = 81 - _displayedNumberCount;
    NSLog(@"_numbersToReveal = %d", _numbersToReveal);
    
    if ([self CheckThisSudoku: self.sudoku] ) {
        NSLog(@"Reveal Hint");
        if (_numbersToReveal > 0) {
        NSMutableArray *numberReveal = [self GenerateNRandomNumbers:1];
            for(int i = 0; i < _field.count; i++){
                for(int j = 0; j < [[_field objectAtIndex:i] count]; j++){
                    for(int n = 0; n < [numberReveal count]; n++){
                        if([[numberReveal objectAtIndex:n] intValue] == i + j*9){
                            UITextField *currentTextField = [[_textFields objectAtIndex:i] objectAtIndex:j];
                            if(currentTextField.text.length > 0){ // checks if text field is empty
                                return [self ActionHintButton:sender]; // if not empty do another square
                            }
                            currentTextField.text = [NSString stringWithFormat:@"%@", [[_field objectAtIndex:i] objectAtIndex:j]];
                            currentTextField.userInteractionEnabled = NO;
                            _numbersToReveal = _numbersToReveal - 1; // reveals square and counts down, so doesnt go past array when all text fields are full. As otherwise it is searching forever
                            NSLog(@"_numbersToReveal is %d", _numbersToReveal);
                        }
                    }
                }
            }
        }
    }
}

#pragma mark - Check Function
- (IBAction)ActionCheckButton:(UIButton *)sender {
    
    [self UpdateSudoku];
    [self HighlightIfWrong:_sudoku];
    
    NSLog(@"_sudoku: %@", _sudoku);
    if ([self CheckThisSudoku:_sudoku]) {
        [self performSegueWithIdentifier:@"GameToEnd" sender:self];
    }
    
}


-(BOOL)CheckThisSudoku:(NSMutableArray*)sudoku{
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
            int box = (i / 3) % 3 + (j / 3) * 3;
            int test_num = [[[sudoku objectAtIndex:i] objectAtIndex:j] intValue];
            [[sudoku objectAtIndex:i] replaceObjectAtIndex:j withObject:@"0"];
            
            if ([self IsThereA:test_num inBox:box inSudoku:sudoku] || [self IsThereA:test_num inRow:i inSudoku:sudoku] || [self IsThereA:test_num inColumn:j inSudoku:sudoku]){
                [[sudoku objectAtIndex:i] replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d", test_num]]; // checks test value against game rules
                return NO;
            }
            [[sudoku objectAtIndex:i] replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d", test_num]];
        }
    }
    return YES;
}

-(void)HighlightIfWrong:(NSMutableArray*)sudoku{
    for(int i = 0; i < 9; i++){
        for(int j = 0; j < 9; j++){
            int box = (i / 3) % 3 + (j / 3) * 3;
            int test_num = [[[sudoku objectAtIndex:i] objectAtIndex:j] intValue];
            [[sudoku objectAtIndex:i] replaceObjectAtIndex:j withObject:@"0"];
            UITextField *currentTextField = [[_textFields objectAtIndex:i] objectAtIndex:j];
            if ([self IsThereA:test_num inBox:box inSudoku:sudoku] || [self IsThereA:test_num inRow:i inSudoku:sudoku] || [self IsThereA:test_num inColumn:j inSudoku:sudoku]){
                if (currentTextField.text.length > 0) {
                currentTextField.textColor = [UIColor redColor]; // sets text to be red so if empty left black
                }
                else {
                    currentTextField.textColor = [UIColor blackColor];
                }
            }
            else{
                currentTextField.textColor = [UIColor blackColor];
            }
            [[sudoku objectAtIndex:i] replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d", test_num]];
        }
    }
}

#pragma mark - Generate Sudoku
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
            NSLog(@"field fill =%@",_field);
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

#pragma mark - Solve Function
- (IBAction)ActionSolveButton:(UIButton *)sender {
    
    
    // adapted from: https://www.youtube.com/watch?v=ka5jb_4ZBYs
    
    [self UpdateSudoku];
    
    [self HighlightIfWrong:_sudoku];
    NSLog(@"_sudoku: %@", _sudoku);
    
    [self UpdateSudoku];
    NSLog(@"_sudoku: %@", _sudoku);
    
    
    // call solve sudoku and store returned array in solvedSudoku
    
    self.SolvedSudoku = [self SolveThisSudoku:self.sudoku index:0];
        
    [self performSegueWithIdentifier:@"GameToSolved" sender:self];
    
    
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
            }
        }
        [[sudoku objectAtIndex:row] setObject:@"0" atIndex:column];
    }
    
    return sudoku;
}
    

#pragma mark - Is There An "X" In ...
-(BOOL)IsThereA:(int)n inRow:(int)row inSudoku:(NSArray*)sudoku{
    for(int i = 0; i < 9; i++) {
        if([[[sudoku objectAtIndex:row] objectAtIndex:i] intValue] == n){ // checks if occurs in row before
            return YES;
        }
    }
    return NO;
}

-(BOOL)IsThereA:(int)n inColumn:(int)column inSudoku:(NSArray*)sudoku{
    for(int i = 0; i < 9; i++) {
        if([[[sudoku objectAtIndex:i] objectAtIndex:column] intValue] == n){ // checks if occurs in column before
            return YES;
        }
    }
    return NO;
}

-(BOOL)IsThereA:(int)n inBox:(int)Box inSudoku:(NSArray*)sudoku{
    int column_offset = 3 * (Box / 3); // eg. 012012012
    int row_offset = 3 * (Box % 3); // eg. 000111222
    for(int i = 0; i < 9; i++){
        int column = column_offset + i / 3;
        int row = row_offset + i % 3;
        if([[[sudoku objectAtIndex:row] objectAtIndex:column] intValue] == n){ // checks if occurs in box again
            return YES;
        }
    }
    return NO;
}

#pragma mark - Sending Information Through Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"GameToSolved"]){
        SolverEndViewController *tvc = segue.destinationViewController;
        NSLog(@">> solved sudoku segued: %@", self.SolvedSudoku);
        tvc.SolvedSudoku = self.SolvedSudoku; // send array through segue
        
    }
    
    
}

#pragma mark - Update Sudoku (called in check and solve)
-(void)UpdateSudoku{
    // adapted from: https://www.youtube.com/watch?v=ka5jb_4ZBYs
    // create nsmarray called sudoku
    
    //NSLog(@"Updating sudoku");
    self.displayedNumberCount =0;
    
    for(int i = 0; i < 9; i++){
        //create nsmarray called rowTemp
        NSMutableArray *tempRow = [NSMutableArray array];
        [self.sudoku addObject:tempRow];
        for(int j = 0; j < 9; j++){
            // check if text field has text inside it
            // if yes put that text into the sudoku at [i][j]
            // if no put @"0" in the sudoku
            UITextField *textField = [[_textFields objectAtIndex:i] objectAtIndex:j];
            if (textField.text.length > 0) { //https://stackoverflow.com/questions/3173679/objective-c-checking-whether-text-field-is-empty
                //self.sudoku[i][j] = textField.text;
                NSString *a = textField.text;
                NSString *b = [NSString stringWithFormat:@"%@*", a]; // adds start for later check, see next page (segue)
                self.sudoku[i][j] = b;
                self.displayedNumberCount += 1; // increments, to count how many numbers are on the current state
            }
            else{
                self.sudoku[i][j] = @"0";
            }
        }
    }
    NSLog(@"displayedNumberCount = %d", _displayedNumberCount);
    NSLog(@"numbersToReveal = %d", _numbersToReveal);
}

@end


