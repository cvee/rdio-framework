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
    NSString *baseIcon;
    NSString *displayName;
    NSString *firstName;
    NSString *gender;
    NSURL *iconURL;
    NSString *lastName;
    RDTrack *lastSongPlayed;
    NSDate *lastSongPlayTime;
    NSNumber *libraryVersion;
    NSURL *profileURL;
    NSNumber *trackCount;
    NSString *userName;
}

// Properties
@property (nonatomic, copy) NSString *baseIcon;
@property (nonatomic, copy) NSString *displayName;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, retain) NSURL *iconURL;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, retain) RDTrack *lastSongPlayed;
@property (nonatomic, retain) NSDate *lastSongPlayTime;
@property (nonatomic, retain) NSNumber *libraryVersion;
@property (nonatomic, retain) NSURL *profileURL;
@property (nonatomic, retain) NSNumber *trackCount;
@property (nonatomic, copy) NSString *userName;

@end

#endif
