//
//  ModalViewController.h
//  CustomPresentAnimation-master
//
//  Created by Product Division 1 on 15/9/21.
//  Copyright (c) 2015年 gph. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModalViewController;

@protocol ModalViewControllerDelegate <NSObject>

-(void)modalViewControllerDidClickedDismissButton:(ModalViewController*)viewcontroller;

@end

@interface ModalViewController : UIViewController

@property(nonatomic,weak)id<ModalViewControllerDelegate>delegate;

@end
