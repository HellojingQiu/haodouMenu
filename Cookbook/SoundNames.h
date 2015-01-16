//
//  SoundNames.h
//  Hardest 2
//
//  Created by chengfang on 14-11-4.
//  Copyright (c) 2014年 Claire. All rights reserved.
//定义声音文件名的宏

/*
 加载声音用得宏
 */
#define kSoundClick @"click.mp3"
#define kSoundChainDrop @"chain_drop.mp3"
//#define kSoundDroptitle1 @"drop_title_1.mp3"
//#define kSoundDroptitle2 @"drop_title_3.mp3"
//#define kSoundDroptitle3 @"drop_title_3.mp3"
#define kSoundDroptitle(n) [NSString stringWithFormat:@"drop_title_%d.mp3",n]

#define kSoundNewpop @"new_pop.mp3"
#define kSoundReadyGo @"ready_go.mp3"
#define kSoundStageReady @"stage_ready.mp3"
#define kSoundTap @"tap.mp3"

/*
 加载声音开关设置
 */
#define kSoundMute @"soundMute"
#define kMusicMute @"musicMute"