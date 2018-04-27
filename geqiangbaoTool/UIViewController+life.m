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
//        [UIViewController meth]
        [UIViewController methodExchangeWithOriginSelector:@selector(viewWillAppear:) byNewSelector:@selector(life_viewWillAppear:)];
//
//        Method m1 = class_getInstanceMethod([self class], @selector(viewDidLoad));
//        Method m2 = class_getInstanceMethod([self class], @selector(life_viewDidLoad));
//        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
//        BOOL b1 = class_addMethod(self, @selector(viewDidLoad), method_getImplementation(m2), method_getTypeEncoding(m2));
//        if (b1) {
//            //如果成功，说明类中不存在这个方法的实现
//            //将被交换方法的实现替换到这个并不存在的实现
//            class_replaceMethod(self, @selector(life_viewDidLoad), method_getImplementation(m1), method_getTypeEncoding(m1));
//        } else {
//            method_exchangeImplementations(m1, m2);
//        }
//        Method n1 = class_getInstanceMethod([self class], @selector(viewWillAppear:));
//        Method n2 = class_getInstanceMethod([self class], @selector(life_viewWillAppear:));
//        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
//        BOOL b2 = class_addMethod(self, @selector(viewWillAppear:), method_getImplementation(n2), method_getTypeEncoding(n2));
//        if (b2) {
//            //如果成功，说明类中不存在这个方法的实现
//            //将被交换方法的实现替换到这个并不存在的实现
//            class_replaceMethod(self, @selector(life_viewWillAppear), method_getImplementation(n1), method_getTypeEncoding(n1));
//        } else {
//            method_exchangeImplementations(n1, n2);
//        }
//
//        Method p1 = class_getInstanceMethod([self class], @selector(viewWillDisappear:));
//        Method p2 = class_getInstanceMethod([self class], @selector(life_viewWillDisappear:));
//        //首先动态添加方法，实现是被交换的方法，返回值表示添加成功还是失败
//        BOOL b3 = class_addMethod(self, @selector(viewWillDisappear:), method_getImplementation(p2), method_getTypeEncoding(p2));
//        if (b3) {
//            //如果成功，说明类中不存在这个方法的实现
//            //将被交换方法的实现替换到这个并不存在的实现
//            class_replaceMethod(self, @selector(life_viewWillDisappear), method_getImplementation(p1), method_getTypeEncoding(p1));
//        } else {
//            method_exchangeImplementations(p1, p2);
//        }
        
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


@end
