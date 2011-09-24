//
//  RDObject.h
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

#ifndef RDARTIST_H
#define RDARTIST_H

#import "RDObject.h"


@class NSNumber;
@class NSString;
@class NSURL;

@interface RDArtist : RDObject
{
    NSNumber *_albumCount;
    NSString *_baseIcon;
    NSURL *_iconURL;
    NSString *_name;
    NSURL *_profileURL;
    NSString *_radioKey;
    BOOL _radioStationAvailable;
    NSURL *_shortURL;
    NSString *_topSongsKey;
    NSNumber *_trackCount;
}

// Properties
@property (nonatomic, retain, getter=albumCount, setter=setAlbumCount:) NSNumber *_albumCount;
@property (nonatomic, copy, getter=baseIcon, setter=setBaseIcon:) NSString *_baseIcon;
@property (nonatomic, retain, getter=iconURL, setter=setIconURL:) NSURL *_iconURL;
@property (nonatomic, copy, getter=name, setter=setName:) NSString *_name;
@property (nonatomic, retain, getter=profileURL, setter=setProfileURL:) NSURL *_profileURL;
@property (nonatomic, copy, getter=radioKey, setter=setRadioKey:) NSString *_radioKey;
@property (nonatomic, assign, getter=isRadioStationAvailable, setter=setRadioStationAvailable:) BOOL _radioStationAvailable;
@property (nonatomic, retain, getter=shortURL, setter=setShortURL:) NSURL *_shortURL;
@property (nonatomic, copy, getter=topSongsKey, setter=setTopSongsKey:) NSString *_topSongsKey;
@property (nonatomic, retain, getter=trackCount, setter=setTrackCount:) NSNumber *_trackCount;

@end

#endif
