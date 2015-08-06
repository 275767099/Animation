//
//  TabViewController.m
//  Animation
//
//  Created by YSH on 15/7/30.
//  Copyright (c) 2015年 MMXCOO. All rights reserved.
//

#import "TabViewController.h"
#import "ViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

}

- (IBAction)animation:(UIButton *)sender {
    
    ViewController * vc = [ViewController new];

//    [UIView beginAnimations:@"View Flip" context:nil];
//    //动画持续时间
//    [UIView setAnimationDuration:1];
//    //设置动画的回调函数，设置后可以使用回调方法
//    [UIView setAnimationDelegate:nil];
//    //设置动画曲线，控制动画速度
//    [UIView  setAnimationCurve: UIViewAnimationCurveEaseInOut];
//    //设置动画方式，并指出动画发生的位置
//    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[[[UIApplication sharedApplication]delegate]window]  cache:YES];
//    //提交UIView动画
//    [UIView commitAnimations];
    [[[UIApplication sharedApplication]delegate]window].rootViewController = vc;
    
    
    
}



@end
