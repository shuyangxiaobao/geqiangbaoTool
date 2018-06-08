//
//  gqb_decode.h
//  geqiangbaoTool_demo
//
//  Created by 戈强宝 on 2018/6/8.
//  Copyright © 2018年 戈强宝. All rights reserved.
//

// 一句宏搞定归解档
#import "NSObject+gqbExtension.h"

#define CodingImplementation  \
- (instancetype)initWithCoder:(NSCoder *)aDecoder {\
if (self = [super init]) {\
[self decode:aDecoder];\
}\
return self;\
}\
- (void)encodeWithCoder:(NSCoder *)aCoder {\
[self encode:aCoder];\
}

