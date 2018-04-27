//
//  PublicTool.h
//  geqiangbaoTool_demo
//
//  Created by 戈强宝 on 2018/4/27.
//  Copyright © 2018年 戈强宝. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicTool : NSObject

//字典转换成JSON字符串
+ (NSString *)JSONStringWithDic:(NSDictionary*)dic;

//JSON字符串转换成字典
+ (NSDictionary *)dictionaryWithJSON:(NSString *)json ;

//字符串MD5加密
+ (NSString *)MD5String:(NSString *)string;

@end

