//
//  RDPlaylist.h
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

#ifndef RDPLAYLIST_H
#define RDPLAYLIST_H

#import "RDObject.h"


@class NSDate;
@class NSNumber;
@class NSString;
@class NSURL;

@interface RDPlaylist : RDObject
{
    NSString *_baseIcon;
    NSURL *_embedURL;
    NSURL *_iconURL;
    NSDate *_lastUpdated;
    NSString *_name;
    NSURL *_profileURL;
    NSURL *_shortURL;
    NSNumber *_trackCount;
    NSString *_userKey;
    NSString *_userDisplayName;
    NSURL *_userIconURL;
    NSURL *_userProfileURL;
}

// Properties
@property (nonatomic, copy, getter=baseIcon, setter=setBaseIcon) NSString *_baseIcon;
@property (nonatomic, retain, getter=embedURL, setter=setEmbedURL) NSURL *_embedURL;
@property (nonatomic, retain, getter=iconURL, setter=setIconURL) NSURL *_iconURL;
@property (nonatomic, retain, getter=lastUpdated, setter=setLastUpdated) NSDate *_lastUpdated;
@property (nonatomic, copy, getter=name, setter=setName) NSString *_name;
@property (nonatomic, retain, getter=profileURL, setter=setProfileURL) NSURL *_profileURL;
@property (nonatomic, retain, getter=shortURL, setter=setShortURL) NSURL *_shortURL;
@property (nonatomic, retain, getter=trackCount, setter=setTrackCount) NSNumber *_trackCount;
@property (nonatomic, copy, getter=userKey, setter=setUserKey) NSString *_userKey;
@property (nonatomic, copy, getter=userDisplayName, setter=setUserDisplayName) NSString *_userDisplayName;
@property (nonatomic, retain, getter=userIconURL, setter=setUserIconURL) NSURL *_userIconURL;
@property (nonatomic, retain, getter=userProfileURL, setter=setUserProfileURL) NSURL *_userProfileURL;


@end

#endif
