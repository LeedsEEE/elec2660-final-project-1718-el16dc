//
//  EndGameViewController.m
//  
//
//  Created by Daniel Colligan [el16dc] on 27/11/2017.
//
//

#import "EndGameViewController.h"

@interface EndGameViewController ()

@end

@implementation EndGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    [self performSegueWithIdentifier:@"GameEndToHome" sender:self]; // segues back home
}
@end
