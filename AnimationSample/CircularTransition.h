//
//  CircularTransition.h
//  AnimationSample
//
//  Created by imac on 12/6/17.
//  Copyright © 2017 Datum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CircularTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (strong, nonatomic)  UIView *circleView;

@property CGPoint startingPoint;

@property NSTimeInterval duration;

@property UIColor* circleColor;

typedef enum {
    
    present,
    dismiss,
    pop
    
} TransitionMode;

@property TransitionMode transitionMode;


@end
