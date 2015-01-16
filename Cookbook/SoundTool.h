//
//  SoundTool.h
//  Hardest 2
//
//  Created by chengfang on 14-11-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "SoundNames.h"
@interface SoundTool : NSObject

//+(SoundTool *)shareSoundTool;
//单例在宏里面设计
kSingleton_interface(SoundTool)

-(void)playSound:(NSString *)soundName;

-(void)playBgMusic;

@property (assign,nonatomic) BOOL musicMute;

@property (assign,nonatomic) BOOL soundMute;

@end
