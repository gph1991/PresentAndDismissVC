//
//  ViewController.m
//  CustomPresentAnimation-master
//
//  Created by Product Division 1 on 15/9/21.
//  Copyright (c) 2015年 gph. All rights reserved.
//

#import "NormalDismissAnimation.h"
#import "SwipeUpInteractiveTransition.h"
#import "BouncePresentAnimation.h"
#import "ModalViewController.h"
#import "ViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate,ModalViewControllerDelegate,UIViewControllerAnimatedTransitioning>

@property(strong,nonatomic)BouncePresentAnimation *presentAnimation;

@property(strong,nonatomic)NormalDismissAnimation *dismissAnimation;
@property(nonatomic,strong) SwipeUpInteractiveTransition *transitionController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor= [UIColor cyanColor];
    self.presentAnimation = [[BouncePresentAnimation alloc]init];
    self.transitionController = [[SwipeUpInteractiveTransition alloc]init];
    self.dismissAnimation = [[NormalDismissAnimation alloc]init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) buttonClicked:(id)sender
{
    ModalViewController *mvc =  [[ModalViewController alloc] init];
    mvc.delegate = self;
    mvc.transitioningDelegate = self;
    [self.transitionController wireToViewController:mvc];
    [self presentViewController:mvc animated:YES completion:nil];
}

-(void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController
{
    //[self dismissViewControllerAnimated:YES completion:nil];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}


-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.dismissAnimation;
}


-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator
{
    return  self.transitionController.interacting?self.transitionController:nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
