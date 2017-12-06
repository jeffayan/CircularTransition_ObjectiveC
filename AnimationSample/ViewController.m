//
//  ViewController.m
//  AnimationSample
//
//  Created by imac on 12/6/17.
//  Copyright © 2017 Datum. All rights reserved.
//

#import "ViewController.h"
#import "CircularTransition.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    CircularTransition *transition;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    transition = [[CircularTransition alloc] init];
}




-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    return [self setTransitionStyle:present];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    
    return [self setTransitionStyle:dismiss];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    SecondViewController *secondVC = segue.destinationViewController;
    secondVC.transitioningDelegate = self;
    secondVC.modalPresentationStyle = UIModalPresentationCustom;
    
}


//MARK:- Setting Transition Style

-(CircularTransition * ) setTransitionStyle : (TransitionMode) mode{

    transition.transitionMode = mode;
    transition.startingPoint = _menuButton.center;
    transition.circleColor = _menuButton.backgroundColor;
    transition.duration = 0.7;
    return transition;
    
}



@end
