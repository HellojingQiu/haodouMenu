//
//  SoundTool.m
//  Hardest 2
//
//  Created by chengfang on 14-11-3.
//  Copyright (c) 2014年 Claire. All rights reserved.
//

#import "SoundTool.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundTool()
{
    AVAudioPlayer *_player;
    NSMutableDictionary *_sounds;
}

@end

@implementation SoundTool
kSingleton_implementation(SoundTool)


-(id)init
{
    if (self=[super init]) {
//        [self loadMusic];
        [self loadSound];
        
        //初始化声音读档
//        _musicMute=[[NSUserDefaults standardUserDefaults] boolForKey:kMusicMute];
//        _soundMute=[[NSUserDefaults standardUserDefaults] boolForKey:kSoundMute];
        
    }
    
    return self;
}
#pragma mark 加载背景音乐
//加载背景音乐
-(void)loadMusic
{
    NSURL *url=[[NSBundle mainBundle] URLForResource:@"bg_music.mp3" withExtension:nil];
    
    _player=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    [_player prepareToPlay];
    
    _player.numberOfLoops=-1;
    
}
#pragma mark 播放背景声音
-(void)playBgMusic
{
    if (_musicMute) return;
    [_player play];
}

#pragma mark  加载音效
-(void)loadSound
{
    _sounds=[NSMutableDictionary dictionary];
    //首先读取URL
    NSURL *soundUrl=[[NSBundle mainBundle] URLForResource:@"shake_match.wav" withExtension:nil];
    
    SystemSoundID systemId;
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundUrl), &systemId);
    
    [_sounds setObject:@(systemId) forKey:@"shake_match"];
}

#pragma mark 播放音效
-(void)playSound:(NSString *)soundName
{
    if (_soundMute) return;
    SystemSoundID id=[_sounds[soundName] unsignedIntValue];
    AudioServicesPlaySystemSound(id);
}

#pragma mark 重写音效设置
-(void)setSoundMute:(BOOL)soundMute
{
    _soundMute=soundMute;
    
    //归档存储
    [[NSUserDefaults standardUserDefaults] setBool:_soundMute forKey:kSoundMute];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self playSound:kSoundClick];
}

#pragma mark 重写背景音乐设置
-(void)setMusicMute:(BOOL)musicMute
{
    _musicMute=musicMute;
    
    //归档存储
    [[NSUserDefaults standardUserDefaults] setBool:_musicMute forKey:kMusicMute];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (_musicMute) {
        [_player pause];
    }else
    {
        [_player play];
    }
    [self playSound:kSoundClick];
}

@end
