//
//  Singleton.h
//  Hardest 2
//
//  Created by chengfang on 14-11-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

/*
 单例方法
 kSingleton_interface用在接口处
 kSingleton_implementation用在实现处
 参数classNamec传入类名
 */

#define kSingleton_interface(className) +(className *)share##className;

#define kSingleton_implementation(className)\
static className *_instance;\
+(id)allocWithZone:(struct _NSZone *)zone\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance=[super allocWithZone:zone];\
    });\
    return _instance;\
}\
+(className *)share##className\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance=[[self alloc] init];\
    });\
    return _instance;\
}