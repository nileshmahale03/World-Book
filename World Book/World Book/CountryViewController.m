//
//  CountryViewController.m
//  World Book
//
//  Created by Nilesh Mahale on 10/10/15.
//  Copyright © 2015 Code-Programming. All rights reserved.
//

#import "CountryViewController.h"

@interface CountryViewController ()

@end

@implementation CountryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.countryName;
    self.countryFlagImageView.image = [UIImage imageNamed:self.countryName];
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

- (IBAction)closeAction:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
