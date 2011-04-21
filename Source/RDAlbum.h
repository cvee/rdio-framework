//
//  RDAlbum.h
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

#ifndef RDALBUM_H
#define RDALBUM_H

#import "RDObject.h"


@class NSDate;
@class NSNumber;
@class NSString;
@class NSURL;

@interface RDAlbum : RDObject
{
    NSString *_artistKey;
    NSString *_artistName;
    NSURL *_artistURL;
    NSString *_baseIcon;
    BOOL _clean;
    BOOL _downloadable;
    BOOL _downloadableAlbumOnly;
    NSNumber *_duration;
    NSURL *_embedURL;
    BOOL _explicit;
    NSURL *_iconURL;
    NSString *_name;
    NSNumber *_playCount;
    NSNumber *_price;
    NSURL *_profileURL;
    NSDate *_releaseDate;
    BOOL _sampleable;
    NSURL *_shortURL;
    BOOL _streamable;
    BOOL _syncable;
    NSNumber *_trackCount;
}

// Properties
@property (nonatomic, copy, getter=albumArtistKey, setter=setAlbumArtistKey) NSString *_albumArtistKey;
@property (nonatomic, copy, getter=albumArtistName, setter=setAlbumArtistName) NSString *_albumArtistName;
@property (nonatomic, copy, getter=albumKey, setter=setAlbumKey) NSString *_albumKey;
@property (nonatomic, copy, getter=albumName, setter=setAlbumName) NSString *_albumName;
@property (nonatomic, retain, getter=albumURL, setter=setAlbumURL) NSURL *_albumURL;
@property (nonatomic, copy, getter=artistKey, setter=setArtistKey) NSString *_artistKey;
@property (nonatomic, copy, getter=artistName, setter=setArtistName) NSString *_artistName;
@property (nonatomic, retain, getter=artistURL, setter=setArtistURL) NSURL *_artistURL;
@property (nonatomic, copy, getter=baseIcon, setter=setBaseIcon) NSString *_baseIcon;
@property (nonatomic, assign, getter=isClean, setter=setClean) BOOL _clean;
@property (nonatomic, assign, getter=isDownloadable, setter=setDownloadable) BOOL _downloadable;
@property (nonatomic, assign, getter=isDownloadableAlbumOnly, setter=setDownloadableAlbumOnly) BOOL _downloadableAlbumOnly;
@property (nonatomic, retain, getter=duration, setter=setDuration) NSNumber *_duration;
@property (nonatomic, retain, getter=embedURL, setter=setEmbedURL) NSURL *_embedURL;
@property (nonatomic, assign, getter=isExplicit, setter=setExplicit) BOOL _explicit;
@property (nonatomic, retain, getter=iconURL, setter=setIconURL) NSURL *_iconURL;
@property (nonatomic, copy, getter=name, setter=setName) NSString *_name;
@property (nonatomic, retain, getter=playCount, setter=setPlayCount) NSNumber *_playCount;
@property (nonatomic, retain, getter=price, setter=setPrice) NSNumber *_price;
@property (nonatomic, retain, getter=profileURL, setter=setProfileURL) NSURL *_profileURL;
@property (nonatomic, retain, getter=releaseDate, setter=setReleaseDate) NSDate *_releaseDate;
@property (nonatomic, assign, getter=isSampleable, setter=setSampleable) BOOL _sampleable;
@property (nonatomic, retain, getter=shortURL, setter=setShortURL) NSURL *_shortURL;
@property (nonatomic, assign, getter=isStreamable, setter=setStreamable) BOOL _streamable;
@property (nonatomic, assign, getter=isSyncable, setter=setSyncable) BOOL _syncable;
@property (nonatomic, retain, getter=trackCount, setter=setTrackCount) NSNumber *_trackCount;

@end

#endif
