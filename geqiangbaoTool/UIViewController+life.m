//
//  UIViewController+life.m
//  Runtime0424
//
//  Created by 戈强宝 on 2018/4/25.
//  Copyright © 2018年 戈强宝. All rights reserved.
//

#import "UIViewController+life.h"
#import <objc/message.h>
#import "NSObject+Swizzling.h"

@implementation UIViewController (life)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController methodExchangeWithOriginSelector:@selector(viewWillAppear:) byNewSelector:@selector(life_viewWillAppear:)];
        [UIViewController methodExchangeWithOriginSelector:@selector(dismissViewControllerAnimated:completion:) byNewSelector:@selector(life_dismissViewControllerAnimated:completion:)];
        
    });
}

-(void)life_viewDidLoad{
    [self life_viewDidLoad];
    NSString *className = NSStringFromClass([self class]);
    //    NSLog(@"🐱🐱🐱🐱 viewDidLoad 初始化控制器:%@",className);
}

-(void)life_viewWillAppear:(BOOL)animated{
    [self life_viewWillAppear:animated];
    NSString *className = NSStringFromClass([self class]);
    if([className containsString:@"NavigationController"]){
        return;
    }
    NSLog(@"🐱🐱🐱🐱 viewWillAppear 即将进入控制器:%@",className);
}

-(void)life_viewWillDisappear:(BOOL)animated{
    [self life_viewWillDisappear:animated];
    NSString *className = NSStringFromClass([self class]);
    //    NSLog(@"🐱🐱🐱🐱 即将离开控制器:%@",className);
}

-(void)life_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"🐱🐱🐱🐱 life_dismissViewControllerAnimated:%@",className);
    CATransition *animation = [CATransition animation];
    //    动画起点(在整体动画的百分比)
    animation.startProgress = 0;
    //    动画终点(在整体动画的百分比)
    animation.endProgress = 1.0;
    //设置动画类型
    //    animation.type = kCATransitionReveal;
    animation.type = @"reveal";
    //设置动画时间
    animation.duration = 0.6;
    //设置动画过渡方向
    animation.subtype = kCATransitionFromBottom;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.view.window.layer addAnimation:animation forKey:nil];
    [self life_dismissViewControllerAnimated:NO completion:nil];
}


@end
