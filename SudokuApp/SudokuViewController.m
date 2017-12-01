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
    //[self.sudokuData generateSudoku];

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
    
    
    /*NSMutableArray* firstRow = [[NSMutableArray alloc] init];
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
    
        [_textFields addObject:firstRow];
    [_textFields addObject:secondRow];
    [_textFields addObject:thirdRow];
    [_textFields addObject:fourthRow];
    [_textFields addObject:fifthRow];
    [_textFields addObject:sixthRow];
    [_textFields addObject:seventhRow];
    [_textFields addObject:eighthRow];
    [_textFields addObject:ninthRow];*/
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
            NSLog(@"textField name = %@", textField.restorationIdentifier);
            
        }
     [_textFields addObject:row];
     
     for (int i = 0; i <= 8; i++) {
         NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d",
               [(NSNumber *)[self.field objectAtIndex:(0 + 9*i)] intValue],
               [(NSNumber *)[self.field objectAtIndex:(1 + 9*i)] intValue],
               [(NSNumber *)[self.field objectAtIndex:(2 + 9*i)] intValue],
               [(NSNumber *)[self.field objectAtIndex:(3 + 9*i)] intValue],
               [(NSNumber *)[self.field objectAtIndex:(4 + 9*i)] intValue],
               [(NSNumber *)[self.field objectAtIndex:(5 + 9*i)] intValue],
               [(NSNumber *)[self.field objectAtIndex:(6 + 9*i)] intValue],
               [(NSNumber *)[self.field objectAtIndex:(7 + 9*i)] intValue],
               [(NSNumber *)[self.field objectAtIndex:(8 + 9*i)] intValue]);
     }
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
    
    /*
    for (int i = 0; i <= 8; i++) {
        NSInteger a = [(NSNumber *)[self.field objectAtIndex:(0 + 9*i)] intValue];
        NSInteger b = [(NSNumber *)[self.field objectAtIndex:(1 + 9*i)] intValue];
        NSInteger c = [(NSNumber *)[self.field objectAtIndex:(2 + 9*i)] intValue];
        NSInteger d = [(NSNumber *)[self.field objectAtIndex:(3 + 9*i)] intValue];
        NSInteger e = [(NSNumber *)[self.field objectAtIndex:(4 + 9*i)] intValue];
        NSInteger f = [(NSNumber *)[self.field objectAtIndex:(5 + 9*i)] intValue];
        NSInteger g = [(NSNumber *)[self.field objectAtIndex:(6 + 9*i)] intValue];
        NSInteger h = [(NSNumber *)[self.field objectAtIndex:(7 + 9*i)] intValue];
        NSInteger k = [(NSNumber *)[self.field objectAtIndex:(8 + 9*i)] intValue];
        NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %ld", a, b, c, d, e, f, g, h, k);
                  }
    */
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
}

- (IBAction)ActionCheckButton:(UIButton *)sender {
}

- (IBAction)ActionSolveButton:(UIButton *)sender {
}
- (IBAction)touchOutside:(UIControl *)sender {
    
    NSLog(@"Touch outside"); // IN HERE DO CHECK ROW,COLUMN & BOX RULE CHECK
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
        }
        else{
            for(int i = 0; i < _field.count; i++){
                for(int j = 0; j < [[_field objectAtIndex:i] count]; j++){
                    
                    //[[[[textFields objectAtIndex:i] objectAtIndex:j] textLabel] setText: [NSString stringWithFormat:@"%@", [[_field objectAtIndex:i] objectAtIndex:j]]];
                }
            }
            
            NSLog(@"field fill =%@",_field);
            
           
            /*
            for (int i = 0; i <= 8; i++) {
            NSLog(@"%d, %d, %d, %d, %d, %d, %d, %d, %d",
                      [(NSNumber *)[self.field objectAtIndex:(0 + 9*i)] intValue],
                      [(NSNumber *)[self.field objectAtIndex:(1 + 9*i)] intValue],
                      [(NSNumber *)[self.field objectAtIndex:(2 + 9*i)] intValue],
                      [(NSNumber *)[self.field objectAtIndex:(3 + 9*i)] intValue],
                      [(NSNumber *)[self.field objectAtIndex:(4 + 9*i)] intValue],
                      [(NSNumber *)[self.field objectAtIndex:(5 + 9*i)] intValue],
                      [(NSNumber *)[self.field objectAtIndex:(6 + 9*i)] intValue],
                      [(NSNumber *)[self.field objectAtIndex:(7 + 9*i)] intValue],
                      [(NSNumber *)[self.field objectAtIndex:(8 + 9*i)] intValue]);
            }
             */
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


    @end


