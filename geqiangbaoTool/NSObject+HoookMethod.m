//
//  NSObject+HoookMethod.m
//  geqiangbaoTool_demo
//
//  Created by xiaobao on 2019/4/1.
//  Copyright © 2019年 戈强宝. All rights reserved.
//

#import "NSObject+HoookMethod.h"
#import <objc/message.h>
//#import "NSObject+Swizzling.h"
@implementation NSObject (HoookMethod)

+(void)load{
    unsigned int outCount = 0;

    Method *methods = class_copyMethodList(self.class, &outCount);
    for (int i = 0; i < outCount; i++) {
        Method originMethod = methods[i];
        Method newMethod = class_getInstanceMethod(self, @selector(methodHook));
        method_exchangeImplementations(originMethod, newMethod);
    }
    free(methods);
//    c = [c superclass];
    
}

-(void)methodHook{
    [self methodHook];
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"%s",__func__);
    NSLog(@"😂😂😂😂😂😂😂😂 %@",className);
}

@end
