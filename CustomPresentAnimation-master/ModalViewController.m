//
//  ModalViewController.m
//  CustomPresentAnimation-master
//
//  Created by Product Division 1 on 15/9/21.
//  Copyright (c) 2015年 gph. All rights reserved.
//

#import "ModalViewController.h"

@implementation ModalViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor =  [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Dismiss me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void) buttonClicked:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(modalViewControllerDidClickedDismissButton:)])
    {
        [self.delegate modalViewControllerDidClickedDismissButton:self];
    }
}


@end
