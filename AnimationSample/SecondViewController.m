//
//  SecondViewController.m
//  AnimationSample
//
//  Created by imac on 12/6/17.
//  Copyright © 2017 Datum. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _menuButton.layer.cornerRadius = _menuButton.frame.size.width/2;
}

- (IBAction)dismissAction:(id)sender {
 
    [self dismissViewControllerAnimated:YES completion:NULL];

}

@end

