//
//  SwipeUpInteractiveTransition.h
//  CustomPresentAnimation-master
//
//  Created by Product Division 1 on 15/9/21.
//  Copyright (c) 2015年 gph. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface SwipeUpInteractiveTransition : UIPercentDrivenInteractiveTransition

@property(assign,nonatomic)BOOL interacting;

-(void)wireToViewController:(UIViewController*)viewController;

@end
