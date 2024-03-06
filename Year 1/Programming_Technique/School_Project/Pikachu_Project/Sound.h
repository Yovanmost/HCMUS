#pragma once
#include <Windows.h>
#include <mmsystem.h>
#include <iostream>

void PlaySoundEntrance(){
    PlaySound(TEXT("SoundTrackMini/Entrance.wav"), NULL, SND_FILENAME | SND_ASYNC);
}

void PlaySoundLose(){
    PlaySound(TEXT("SoundTrackMini/Lose.wav"), NULL, SND_FILENAME | SND_LOOP | SND_ASYNC);
}

void PlaySoundWin(){
    PlaySound(TEXT("SoundTrackMini/Win.wav"), NULL, SND_FILENAME | SND_LOOP | SND_ASYNC);
}

void PlaySoundBackGround0(){
    PlaySound(TEXT("SoundTrackMini/BackGround0.wav"), NULL, SND_FILENAME | SND_LOOP | SND_ASYNC);
}

void PlaySoundBackGround1(){
    PlaySound(TEXT("SoundTrackMini/BackGround1.wav"), NULL, SND_FILENAME | SND_LOOP | SND_ASYNC);
}

void PlaySoundBackGround2(){
    PlaySound(TEXT("SoundTrackMini/BackGround2.wav"), NULL, SND_FILENAME | SND_LOOP | SND_ASYNC);
}