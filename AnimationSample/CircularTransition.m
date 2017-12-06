//
//  CircularTransition.m
//  AnimationSample
//
//  Created by imac on 12/6/17.
//  Copyright © 2017 Datum. All rights reserved.
//

#import "CircularTransition.h"

@implementation CircularTransition



//MARK:-  Returning  the animation duration for the Custom animation (Delegate Method)

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
   
    return self.duration;
    
}

//MARK:- Setting up the transition for the view controller (Delegate Method)

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    CGPoint viewCenter;
    CGSize viewSize;
    
    UIView *containerView = transitionContext.containerView;
    
    // If Transition Mode is Present
    
    if (self.transitionMode == present){
        
        UIView *presentedView = [transitionContext viewForKey: UITransitionContextToViewKey];
        
        if (!presentedView){
            NSLog(@" Could not get View from UITransitionContextToViewKey");
            return;
        }
        
        viewCenter = presentedView.center;
        
        viewSize = presentedView.frame.size;
        
        _circleView = [[UIView alloc] init];
        _circleView.frame = [self frameForCircle:viewSize : _startingPoint];
        _circleView.layer.cornerRadius = _circleView.frame.size.height/2;
        _circleView.center = _startingPoint;
        _circleView.backgroundColor = _circleColor;
        _circleView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        [containerView addSubview:_circleView];
        
        presentedView.center = _startingPoint;
        presentedView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        presentedView.alpha = 0;
        [containerView addSubview:presentedView];
        
        [UIView animateWithDuration:_duration animations:^{
            
            _circleView.transform = CGAffineTransformIdentity;
            presentedView.transform = CGAffineTransformIdentity;
            presentedView.alpha = 1;
            presentedView.center = viewCenter;
            
        } completion:^(BOOL finished) {
           
            [transitionContext completeTransition:finished];
            
        }];
        
    } else {
        
       
        UITransitionContextViewKey transitionModeKey = (_transitionMode == pop) ? UITransitionContextToViewKey : UITransitionContextFromViewKey;
        
        UIView *returningView = [transitionContext viewForKey:transitionModeKey];
        
        
        if (!returningView) {
            NSLog(@" Could not get the ReturingView in Pop or Dismiss Transition");
            return;
        }
        
        viewCenter = returningView.center;
        viewSize = returningView.frame.size;
        
        [_circleView setFrame: [self frameForCircle:viewSize :_startingPoint]];
        _circleView.layer.cornerRadius = _circleView.frame.size.height/2;
        _circleView.center = _startingPoint;
        
        
        [UIView animateWithDuration:_duration animations:^{
            
            _circleView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningView.center = _startingPoint;
            returningView.alpha = 0;
            
            if(self.transitionMode == pop){
               
                [containerView insertSubview:returningView belowSubview:returningView];
                [containerView insertSubview:_circleView belowSubview:returningView];
                
            }
            
        } completion:^(BOOL finished) {
           
            returningView.center = viewCenter;
            [returningView removeFromSuperview];
            [_circleView removeFromSuperview];
            [transitionContext completeTransition:finished];
            
        }];
        
        
    }
}
    

//MARK:- Get Frame for Circle View based on Starting Point passed
    
-(CGRect) frameForCircle : (CGSize) viewSize :(CGPoint) startPoint {
    
    
    double xLength = fmax(startPoint.x, viewSize.width-startPoint.x);
    
    double yLength = fmax(startPoint.y, viewSize.height-startPoint.y);
    
    CGFloat offsetVector = sqrt(xLength*xLength+yLength*yLength)*2;
    
   // CGSize  size = CGSizeMake(offsetVector, offsetVector);
    
    return CGRectMake(0, 0, offsetVector, offsetVector);

    
}
    


@end
