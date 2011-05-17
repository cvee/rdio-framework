//
//  RDUser.h
//
//  Copyright (c) 2011, Chris Verwymeren
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without 
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, 
//    this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//  * Neither the name of the organization nor the names of its contributors
//    may be used to endorse or promote products derived from this software 
//    without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
//  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
//  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
//  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
//  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
//  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
//  POSSIBILITY OF SUCH DAMAGE.
//

#ifndef RDUSER_H
#define RDUSER_H

#import "RDObject.h"


@class NSDate;
@class NSNumber;
@class NSString;
@class NSURL;
@class RDTrack;

@interface RDUser : RDObject
{
    NSString *_baseIcon;
    NSString *_displayName;
    NSString *_firstName;
    NSString *_gender;
    NSURL *_iconURL;
    NSString *_lastName;
    RDTrack *_lastSongPlayed;
    NSDate *_lastSongPlayTime;
    NSNumber *_libraryVersion;
    NSURL *_profileURL;
    BOOL _subscriber;
    NSNumber *_trackCount;
    BOOL _trial;
    BOOL _unlimited;
    NSString *_userName;
}

// Properties
@property (nonatomic, copy, getter=baseIcon, setter=setBaseIcon) NSString *_baseIcon;
@property (nonatomic, copy, getter=displayName, setter=setDisplayName) NSString *_displayName;
@property (nonatomic, copy, getter=firstName, setter=setFirstName) NSString *_firstName;
@property (nonatomic, copy, getter=gender, setter=setGender) NSString *_gender;
@property (nonatomic, retain, getter=iconURL, setter=setIconURL) NSURL *_iconURL;
@property (nonatomic, copy, getter=lastName, setter=setLastName) NSString *_lastName;
@property (nonatomic, retain, getter=lastSongPlayed, setter=setLastSongPlayed) RDTrack *_lastSongPlayed;
@property (nonatomic, retain, getter=lastSongPlayTime, setter=setLastSongPlayTime) NSDate *_lastSongPlayTime;
@property (nonatomic, retain, getter=libraryVersion, setter=setLibraryVersion) NSNumber *_libraryVersion;
@property (nonatomic, retain, getter=profileURL, setter=setProfileURL) NSURL *_profileURL;
@property (nonatomic, assign, getter=isSubscriber, setter=setSubscriber) BOOL _subscriber;
@property (nonatomic, retain, getter=trackCount, setter=setTrackCount) NSNumber *_trackCount;
@property (nonatomic, assign, getter=isTrial, setter=setTrial) BOOL _trial;
@property (nonatomic, assign, getter=isUnlimited, setter=setUnlimited) BOOL _unlimited;
@property (nonatomic, copy, getter=userName, setter=setUserName) NSString *_userName;

@end

#endif
