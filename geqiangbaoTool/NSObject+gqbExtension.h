//
//  NSObject+gqbExtension.h
//  geqiangbaoTool_demo
//
//  Created by 戈强宝 on 2018/6/8.
//  Copyright © 2018年 戈强宝. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

- (NSArray *)ignoredNames;
- (void)encode:(NSCoder *)aCoder;
- (void)decode:(NSCoder *)aDecoder;

@end
