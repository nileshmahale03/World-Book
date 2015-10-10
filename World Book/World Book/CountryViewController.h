//
//  CountryViewController.h
//  World Book
//
//  Created by Nilesh Mahale on 10/10/15.
//  Copyright © 2015 Code-Programming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryViewController : UIViewController

//property
@property (strong, nonatomic) IBOutlet UIImageView *countryFlagImageView;

@property (strong, nonatomic) NSString *countryName;

//method
- (IBAction)closeAction:(UIBarButtonItem *)sender;

@end
