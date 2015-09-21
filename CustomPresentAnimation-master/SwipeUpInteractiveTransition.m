//
//  SwipeUpInteractiveTransition.m
//  CustomPresentAnimation-master
//
//  Created by Product Division 1 on 15/9/21.
//  Copyright (c) 2015年 gph. All rights reserved.
//

#import "SwipeUpInteractiveTransition.h"

@interface SwipeUpInteractiveTransition()

@property(assign,nonatomic)BOOL shouldComplete;
@property(nonatomic,strong)UIViewController *presentingVC;

@end

@implementation SwipeUpInteractiveTransition

-(void)wireToViewController:(UIViewController *)viewController
{
    self.presentingVC = viewController;
    [self prepareGestureRecognizerInView:viewController.view];
    
}

-(void)prepareGestureRecognizerInView:(UIView*)view
{
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}
-(void)handleGesture:(UIPanGestureRecognizer*)gestureRecognizer
{
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGFloat fraction = translation.y/[UIScreen mainScreen].bounds.size.height;
            fraction = fminf(1.0, fmaxf(fraction, 0.0));
            self.shouldComplete = fraction > 0.5;
            [self updateInteractiveTransition:fraction];
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            self.interacting = NO;
            if(!self.shouldComplete
               || gestureRecognizer.state == UIGestureRecognizerStateCancelled)
            {
                [self cancelInteractiveTransition];
            }
            else
            {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
    
}












@end
