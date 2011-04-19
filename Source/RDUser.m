//
//  RDUser.m
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

#import "RDUser.h"
#import "RDConstants.h"
#import "RDTrack.h"
#import <Foundation/NSCoder.h>
#import <Foundation/NSDate.h>
#import <Foundation/NSDateFormatter.h>
#import <Foundation/NSDecimalNumber.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSLocale.h>
#import <Foundation/NSNumberFormatter.h>
#import <Foundation/NSString.h>
#import <Foundation/NSURL.h>


#pragma mark -
#pragma mark Constants

NSString *kRDUserBaseIcon = @"baseIcon";
NSString *kRDUserDisplayName = @"displayName";
NSString *kRDUserFirstName = @"firstName";
NSString *kRDUserGender = @"gender";
NSString *kRDUserIconURL = @"iconURL";
NSString *kRDUserLastName = @"lastName";
NSString *kRDUserLastSongPlayed = @"lastSongPlayed";
NSString *kRDUserLastSongPlayTime = @"lastSongPlayTime";
NSString *kRDUserLibraryVersion = @"libraryVersion";
NSString *kRDUserProfileURL = @"profileURL";
NSString *kRDUserTrackCount = @"trackCount";
NSString *kRDUserUserName = @"userName";

#pragma mark -

@implementation RDUser

#pragma mark -
#pragma mark Properties

@synthesize baseIcon;
@synthesize displayName;
@synthesize firstName;
@synthesize gender;
@synthesize iconURL;
@synthesize lastName;
@synthesize lastSongPlayed;
@synthesize lastSongPlayTime;
@synthesize libraryVersion;
@synthesize profileURL;
@synthesize trackCount;
@synthesize userName;

#pragma mark -
#pragma mark Initialization

- (id)initWithDictionary:(NSDictionary *)aDictionary
{
    if (!(self = [super initWithDictionary:aDictionary])) return nil;

    NSLocale *locale = [[NSLocale alloc]
        initWithLocaleIdentifier:RDWebServiceLocaleIdentifier];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setLocale:locale];
    [locale release];

    id aBaseIcon = [aDictionary objectForKey:@"baseIcon"];
    if ([aBaseIcon isKindOfClass:[NSString class]])
    {
        baseIcon = [(NSString *)aBaseIcon copy];
    }

    id aDisplayName = [aDictionary objectForKey:@"displayName"];
    if ([aDisplayName isKindOfClass:[NSString class]])
    {
        displayName = [(NSString *)aDisplayName copy];
    }

    id aFirstName = [aDictionary objectForKey:@"firstName"];
    if ([aFirstName isKindOfClass:[NSString class]])
    {
        firstName = [(NSString *)aFirstName copy];
    }

    id aGender = [aDictionary objectForKey:@"gender"];
    if ([aGender isKindOfClass:[NSString class]])
    {
        gender = [(NSString *)aGender copy];
    }

    id aIconURL = [aDictionary objectForKey:@"icon"];
    if ([aIconURL isKindOfClass:[NSString class]])
    {
        iconURL = [[NSURL alloc] initWithString:aIconURL];
    }
    if ([aIconURL isKindOfClass:[NSURL class]])
    {
        iconURL = [(NSURL *)aIconURL retain];
    }

    id aLastName = [aDictionary objectForKey:@"lastName"];
    if ([aLastName isKindOfClass:[NSString class]])
    {
        lastName = [(NSString *)aLastName copy];
    }

    id aLastSongPlayed = [aDictionary objectForKey:@"lastSongPlayed"];
    if ([aLastSongPlayed isKindOfClass:[NSDictionary class]])
    {
        lastSongPlayed = [[RDTrack alloc] initWithDictionary:(NSDictionary *)aLastSongPlayed];
    }

    id aLastSongPlayTime = [aDictionary objectForKey:@"lastSongPlayTime"];
    if ([aLastSongPlayTime isKindOfClass:[NSDate class]])
    {
        lastSongPlayTime = [(NSDate *)aLastSongPlayTime retain];
    }
    else if ([aLastSongPlayTime isKindOfClass:[NSString class]])
    {
        //ISO 8601 Combined date and time representation
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm"];
        lastSongPlayTime = [[dateFormatter dateFromString:(NSString *)aLastSongPlayTime] retain];
    }

    id aLibraryVersion = [aDictionary objectForKey:@"libraryVersion"];
    if ([aLibraryVersion isKindOfClass:[NSNumber class]])
    {
        libraryVersion = [(NSNumber *)aLibraryVersion retain];
    }
    else if ([aLibraryVersion isKindOfClass:[NSString class]])
    {
        libraryVersion = [[numberFormatter numberFromString:(NSString *)aLibraryVersion] retain];
    }

    id aProfileURL = [aDictionary objectForKey:@"url"];
    if ([aProfileURL isKindOfClass:[NSString class]])
    {
        profileURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", RDWebsiteBaseURLString, (NSString *)aProfileURL]];
    }
    if ([aProfileURL isKindOfClass:[NSURL class]])
    {
        profileURL = [(NSURL *)aProfileURL retain];
    }

    id aTrackCount = [aDictionary objectForKey:@"trackCount"];
    if ([aTrackCount isKindOfClass:[NSNumber class]])
    {
        trackCount = [(NSNumber *)aTrackCount retain];
    }
    else if ([aTrackCount isKindOfClass:[NSString class]])
    {
        trackCount = [[numberFormatter numberFromString:(NSString *)aTrackCount] retain];
    }

    id aUserName = [aDictionary objectForKey:@"username"];
    if ([aUserName isKindOfClass:[NSString class]])
    {
        userName = [(NSString *)aUserName copy];
    }

    [dateFormatter release];
    [numberFormatter release];

    return self;
}

#pragma mark -
#pragma mark Deallocation

- (void)dealloc
{
    [baseIcon release];
    baseIcon = nil;
    [displayName release];
    displayName = nil;
    [firstName release];
    firstName = nil;
    [gender release];
    gender = nil;
    [iconURL release];
    iconURL = nil;
    [lastName release];
    lastName = nil;
    [lastSongPlayed release];
    lastSongPlayed = nil;
    [lastSongPlayTime release];
    lastSongPlayTime = nil;
    [libraryVersion release];
    libraryVersion = nil;
    [profileURL release];
    profileURL = nil;
    [trackCount release];
    trackCount = nil;
    [userName release];
    userName = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];

    [encoder encodeObject:baseIcon forKey:kRDUserBaseIcon];
    [encoder encodeObject:displayName forKey:kRDUserDisplayName];
    [encoder encodeObject:firstName forKey:kRDUserFirstName];
    [encoder encodeObject:gender forKey:kRDUserGender];
    [encoder encodeObject:iconURL forKey:kRDUserIconURL];
    [encoder encodeObject:lastName forKey:kRDUserLastName];
    [encoder encodeObject:lastSongPlayed forKey:kRDUserLastSongPlayed];
    [encoder encodeObject:lastSongPlayTime forKey:kRDUserLastSongPlayTime];
    [encoder encodeObject:libraryVersion forKey:kRDUserLibraryVersion];
    [encoder encodeObject:profileURL forKey:kRDUserProfileURL];
    [encoder encodeObject:trackCount forKey:kRDUserTrackCount];
    [encoder encodeObject:userName forKey:kRDUserUserName];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (!(self = [self initWithCoder:decoder])) return nil;

    baseIcon = [decoder decodeObjectForKey:kRDUserBaseIcon];
    displayName = [decoder decodeObjectForKey:kRDUserDisplayName];
    firstName = [decoder decodeObjectForKey:kRDUserFirstName];
    gender = [decoder decodeObjectForKey:kRDUserGender];
    iconURL = [decoder decodeObjectForKey:kRDUserIconURL];
    lastName = [decoder decodeObjectForKey:kRDUserLastName];
    lastSongPlayed = [decoder decodeObjectForKey:kRDUserLastSongPlayed];
    lastSongPlayTime = [decoder decodeObjectForKey:kRDUserLastSongPlayTime];
    libraryVersion = [decoder decodeObjectForKey:kRDUserLibraryVersion];
    profileURL = [decoder decodeObjectForKey:kRDUserProfileURL];
    trackCount = [decoder decodeObjectForKey:kRDUserTrackCount];
    userName = [decoder decodeObjectForKey:kRDUserUserName];

    return self;
}

#pragma mark -
#pragma mark NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone
{
    RDUser *object = [super copyWithZone:zone];

    object->baseIcon = nil;
    [object setBaseIcon:[self baseIcon]];
    object->displayName = nil;
    [object setDisplayName:[self displayName]];
    object->firstName = nil;
    [object setFirstName:[self firstName]];
    object->gender = nil;
    [object setGender:[self gender]];
    object->iconURL = nil;
    [object setIconURL:[self iconURL]];
    object->lastName = nil;
    [object setLastName:[self lastName]];
    object->lastSongPlayed = nil;
    [object setLastSongPlayed:[self lastSongPlayed]];
    object->lastSongPlayTime = nil;
    [object setLastSongPlayTime:[self lastSongPlayTime]];
    object->libraryVersion = nil;
    [object setLibraryVersion:[self libraryVersion]];
    object->profileURL = nil;
    [object setProfileURL:[self profileURL]];
    object->trackCount = nil;
    [object setTrackCount:[self trackCount]];
    object->userName = nil;
    [object setUserName:[self userName]];

    return object;
}

#pragma mark -
#pragma mark NSObject Protocol

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

@end
