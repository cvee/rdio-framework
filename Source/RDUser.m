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
NSString *kRDUserCollectionKey = @"collectionKey";
NSString *kRDUserCollectionURL = @"collectionURL";
NSString *kRDUserDisplayName = @"displayName";
NSString *kRDUserFirstName = @"firstName";
NSString *kRDUserFollowersURL = @"followersURL";
NSString *kRDUserFollowingURL = @"followingURL";
NSString *kRDUserGender = @"gender";
NSString *kRDUserHeavyRotationKey = @"heavyRotationKey";
NSString *kRDUserIconURL = @"iconURL";
NSString *kRDUserLastName = @"lastName";
NSString *kRDUserLastSongPlayed = @"lastSongPlayed";
NSString *kRDUserLastSongPlayTime = @"lastSongPlayTime";
NSString *kRDUserLibraryVersion = @"libraryVersion";
NSString *kRDUserNetworkHeavyRotationKey = @"networkHeavyRotationKey";
NSString *kRDUserPlaylistsURL = @"playlistsURL";
NSString *kRDUserProfileURL = @"profileURL";
NSString *kRDUserSubscriber = @"subscriber";
NSString *kRDUserTrackCount = @"trackCount";
NSString *kRDUserTrial = @"trial";
NSString *kRDUserUnlimited = @"unlimited";
NSString *kRDUserUserName = @"userName";

#pragma mark -

@implementation RDUser

#pragma mark -
#pragma mark Properties

@synthesize _baseIcon;
@synthesize _collectionKey;
@synthesize _collectionURL;
@synthesize _displayName;
@synthesize _firstName;
@synthesize _followersURL;
@synthesize _followingURL;
@synthesize _gender;
@synthesize _heavyRotationKey;
@synthesize _iconURL;
@synthesize _lastName;
@synthesize _lastSongPlayed;
@synthesize _lastSongPlayTime;
@synthesize _libraryVersion;
@synthesize _networkHeavyRotationKey;
@synthesize _playlistsURL;
@synthesize _profileURL;
@synthesize _subscriber;
@synthesize _trackCount;
@synthesize _trial;
@synthesize _unlimited;
@synthesize _userName;

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
        _baseIcon = [(NSString *)aBaseIcon copy];
    }

    id aCollectionKey = [aDictionary objectForKey:@"collectionKey"];
    if ([aCollectionKey isKindOfClass:[NSString class]])
    {
        _collectionKey = [(NSString *)aCollectionKey copy];
    }

    id aCollectionURL = [aDictionary objectForKey:@"collectionUrl"];
    if ([aCollectionURL isKindOfClass:[NSString class]])
    {
        _collectionURL = [[NSURL alloc] initWithString:aCollectionURL];
    }
    if ([aCollectionURL isKindOfClass:[NSURL class]])
    {
        _collectionURL = [(NSURL *)aCollectionURL retain];
    }

    id aDisplayName = [aDictionary objectForKey:@"displayName"];
    if ([aDisplayName isKindOfClass:[NSString class]])
    {
        _displayName = [(NSString *)aDisplayName copy];
    }

    id aFirstName = [aDictionary objectForKey:@"firstName"];
    if ([aFirstName isKindOfClass:[NSString class]])
    {
        _firstName = [(NSString *)aFirstName copy];
    }

    id aFollowersURL = [aDictionary objectForKey:@"followersUrl"];
    if ([aFollowersURL isKindOfClass:[NSString class]])
    {
        _followersURL = [[NSURL alloc] initWithString:aFollowersURL];
    }
    if ([aFollowersURL isKindOfClass:[NSURL class]])
    {
        _followersURL = [(NSURL *)aFollowersURL retain];
    }

    id aFollowingURL = [aDictionary objectForKey:@"followingUrl"];
    if ([aFollowingURL isKindOfClass:[NSString class]])
    {
        _followingURL = [[NSURL alloc] initWithString:aFollowingURL];
    }
    if ([aFollowingURL isKindOfClass:[NSURL class]])
    {
        _followingURL = [(NSURL *)aFollowingURL retain];
    }

    id aGender = [aDictionary objectForKey:@"gender"];
    if ([aGender isKindOfClass:[NSString class]])
    {
        _gender = [(NSString *)aGender copy];
    }

    id aHeavyRotationKey = [aDictionary objectForKey:@"heavyRotationKey"];
    if ([aHeavyRotationKey isKindOfClass:[NSString class]])
    {
        _heavyRotationKey = [(NSString *)aHeavyRotationKey copy];
    }

    id aIconURL = [aDictionary objectForKey:@"icon"];
    if ([aIconURL isKindOfClass:[NSString class]])
    {
        _iconURL = [[NSURL alloc] initWithString:aIconURL];
    }
    if ([aIconURL isKindOfClass:[NSURL class]])
    {
        _iconURL = [(NSURL *)aIconURL retain];
    }

    id aLastName = [aDictionary objectForKey:@"lastName"];
    if ([aLastName isKindOfClass:[NSString class]])
    {
        _lastName = [(NSString *)aLastName copy];
    }

    id aLastSongPlayed = [aDictionary objectForKey:@"lastSongPlayed"];
    if ([aLastSongPlayed isKindOfClass:[NSDictionary class]])
    {
        _lastSongPlayed = [[RDTrack alloc] initWithDictionary:(NSDictionary *)aLastSongPlayed];
    }

    id aLastSongPlayTime = [aDictionary objectForKey:@"lastSongPlayTime"];
    if ([aLastSongPlayTime isKindOfClass:[NSDate class]])
    {
        _lastSongPlayTime = [(NSDate *)aLastSongPlayTime retain];
    }
    else if ([aLastSongPlayTime isKindOfClass:[NSString class]])
    {
        //ISO 8601 Combined date and time representation
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm"];
        _lastSongPlayTime = [[dateFormatter dateFromString:(NSString *)aLastSongPlayTime] retain];
    }

    id aLibraryVersion = [aDictionary objectForKey:@"libraryVersion"];
    if ([aLibraryVersion isKindOfClass:[NSNumber class]])
    {
        _libraryVersion = [(NSNumber *)aLibraryVersion retain];
    }
    else if ([aLibraryVersion isKindOfClass:[NSString class]])
    {
        _libraryVersion = [[numberFormatter numberFromString:(NSString *)aLibraryVersion] retain];
    }

    id aNetworkHeavyRotationKey = [aDictionary objectForKey:@"networkHeavyRotationKey"];
    if ([aNetworkHeavyRotationKey isKindOfClass:[NSString class]])
    {
        _networkHeavyRotationKey = [(NSString *)aNetworkHeavyRotationKey copy];
    }

    id aPlaylistsURL = [aDictionary objectForKey:@"playlistsUrl"];
    if ([aPlaylistsURL isKindOfClass:[NSString class]])
    {
        _playlistsURL = [[NSURL alloc] initWithString:aPlaylistsURL];
    }
    if ([aPlaylistsURL isKindOfClass:[NSURL class]])
    {
        _playlistsURL = [(NSURL *)aPlaylistsURL retain];
    }

    id aProfileURL = [aDictionary objectForKey:@"url"];
    if ([aProfileURL isKindOfClass:[NSString class]])
    {
        _profileURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", RDWebsiteBaseURLString, (NSString *)aProfileURL]];
    }
    if ([aProfileURL isKindOfClass:[NSURL class]])
    {
        _profileURL = [(NSURL *)aProfileURL retain];
    }

    id aSubscriber = [aDictionary objectForKey:@"isSubscriber"];
    if ([aSubscriber isKindOfClass:[NSNumber class]])
    {
        _subscriber = [(NSNumber *)aSubscriber boolValue];
    }

    id aTrackCount = [aDictionary objectForKey:@"trackCount"];
    if ([aTrackCount isKindOfClass:[NSNumber class]])
    {
        _trackCount = [(NSNumber *)aTrackCount retain];
    }
    else if ([aTrackCount isKindOfClass:[NSString class]])
    {
        _trackCount = [[numberFormatter numberFromString:(NSString *)aTrackCount] retain];
    }

    id aTrial = [aDictionary objectForKey:@"isTrial"];
    if ([aTrial isKindOfClass:[NSNumber class]])
    {
        _trial = [(NSNumber *)aTrial boolValue];
    }

    id aUnlimited = [aDictionary objectForKey:@"isUnlimited"];
    if ([aUnlimited isKindOfClass:[NSNumber class]])
    {
        _unlimited = [(NSNumber *)aUnlimited boolValue];
    }

    id aUserName = [aDictionary objectForKey:@"username"];
    if ([aUserName isKindOfClass:[NSString class]])
    {
        _userName = [(NSString *)aUserName copy];
    }

    [dateFormatter release];
    [numberFormatter release];

    return self;
}

#pragma mark -
#pragma mark Deallocation

- (void)dealloc
{
    [_baseIcon release];
    _baseIcon = nil;
    [_collectionKey release];
    _collectionKey = nil;
    [_collectionURL release];
    _collectionURL = nil;
    [_displayName release];
    _displayName = nil;
    [_firstName release];
    _firstName = nil;
    [_followersURL release];
    _followersURL = nil;
    [_followingURL release];
    _followingURL = nil;
    [_gender release];
    _gender = nil;
    [_heavyRotationKey release];
    _heavyRotationKey = nil;
    [_iconURL release];
    _iconURL = nil;
    [_lastName release];
    _lastName = nil;
    [_lastSongPlayed release];
    _lastSongPlayed = nil;
    [_lastSongPlayTime release];
    _lastSongPlayTime = nil;
    [_libraryVersion release];
    _libraryVersion = nil;
    [_networkHeavyRotationKey release];
    _networkHeavyRotationKey = nil;
    [_playlistsURL release];
    _playlistsURL = nil;
    [_profileURL release];
    _profileURL = nil;
    _subscriber = NO;
    [_trackCount release];
    _trackCount = nil;
    _trial = NO;
    _unlimited = NO;
    [_userName release];
    _userName = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];

    [encoder encodeObject:_baseIcon forKey:kRDUserBaseIcon];
    [encoder encodeObject:_collectionKey forKey:kRDUserCollectionKey];
    [encoder encodeObject:_collectionURL forKey:kRDUserCollectionURL];
    [encoder encodeObject:_displayName forKey:kRDUserDisplayName];
    [encoder encodeObject:_firstName forKey:kRDUserFirstName];
    [encoder encodeObject:_followersURL forKey:kRDUserFollowersURL];
    [encoder encodeObject:_followingURL forKey:kRDUserFollowingURL];
    [encoder encodeObject:_gender forKey:kRDUserGender];
    [encoder encodeObject:_heavyRotationKey forKey:kRDUserHeavyRotationKey];
    [encoder encodeObject:_iconURL forKey:kRDUserIconURL];
    [encoder encodeObject:_lastName forKey:kRDUserLastName];
    [encoder encodeObject:_lastSongPlayed forKey:kRDUserLastSongPlayed];
    [encoder encodeObject:_lastSongPlayTime forKey:kRDUserLastSongPlayTime];
    [encoder encodeObject:_libraryVersion forKey:kRDUserLibraryVersion];
    [encoder encodeObject:_networkHeavyRotationKey forKey:kRDUserNetworkHeavyRotationKey];
    [encoder encodeObject:_playlistsURL forKey:kRDUserPlaylistsURL];
    [encoder encodeObject:_profileURL forKey:kRDUserProfileURL];
    [encoder encodeBool:_subscriber forKey:kRDUserSubscriber];
    [encoder encodeObject:_trackCount forKey:kRDUserTrackCount];
    [encoder encodeBool:_trial forKey:kRDUserTrial];
    [encoder encodeBool:_unlimited forKey:kRDUserUnlimited];
    [encoder encodeObject:_userName forKey:kRDUserUserName];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (!(self = [self initWithCoder:decoder])) return nil;

    _baseIcon = [decoder decodeObjectForKey:kRDUserBaseIcon];
    _collectionKey = [decoder decodeObjectForKey:kRDUserCollectionKey];
    _collectionURL = [decoder decodeObjectForKey:kRDUserCollectionURL];
    _displayName = [decoder decodeObjectForKey:kRDUserDisplayName];
    _firstName = [decoder decodeObjectForKey:kRDUserFirstName];
    _followersURL = [decoder decodeObjectForKey:kRDUserFollowersURL];
    _followingURL = [decoder decodeObjectForKey:kRDUserFollowingURL];
    _gender = [decoder decodeObjectForKey:kRDUserGender];
    _heavyRotationKey = [decoder decodeObjectForKey:kRDUserHeavyRotationKey];
    _iconURL = [decoder decodeObjectForKey:kRDUserIconURL];
    _lastName = [decoder decodeObjectForKey:kRDUserLastName];
    _lastSongPlayed = [decoder decodeObjectForKey:kRDUserLastSongPlayed];
    _lastSongPlayTime = [decoder decodeObjectForKey:kRDUserLastSongPlayTime];
    _libraryVersion = [decoder decodeObjectForKey:kRDUserLibraryVersion];
    _networkHeavyRotationKey = [decoder decodeObjectForKey:kRDUserNetworkHeavyRotationKey];
    _playlistsURL = [decoder decodeObjectForKey:kRDUserPlaylistsURL];
    _profileURL = [decoder decodeObjectForKey:kRDUserProfileURL];
    _subscriber = [decoder decodeBoolForKey:kRDUserSubscriber];
    _trackCount = [decoder decodeObjectForKey:kRDUserTrackCount];
    _trial = [decoder decodeBoolForKey:kRDUserTrial];
    _unlimited = [decoder decodeBoolForKey:kRDUserUnlimited];
    _userName = [decoder decodeObjectForKey:kRDUserUserName];

    return self;
}

#pragma mark -
#pragma mark NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone
{
    RDUser *object = [super copyWithZone:zone];

    object->_baseIcon = nil;
    [object setBaseIcon:[self baseIcon]];
    object->_collectionKey = nil;
    [object setCollectionKey:[self collectionKey]];
    object->_collectionURL = nil;
    [object setCollectionURL:[self collectionURL]];
    object->_displayName = nil;
    [object setDisplayName:[self displayName]];
    object->_firstName = nil;
    [object setFirstName:[self firstName]];
    object->_followersURL = nil;
    [object setFollowersURL:[self followersURL]];
    object->_followingURL = nil;
    [object setFollowingURL:[self followingURL]];
    object->_gender = nil;
    [object setGender:[self gender]];
    object->_heavyRotationKey = nil;
    [object setHeavyRotationKey:[self heavyRotationKey]];
    object->_iconURL = nil;
    [object setIconURL:[self iconURL]];
    object->_lastName = nil;
    [object setLastName:[self lastName]];
    object->_lastSongPlayed = nil;
    [object setLastSongPlayed:[self lastSongPlayed]];
    object->_lastSongPlayTime = nil;
    [object setLastSongPlayTime:[self lastSongPlayTime]];
    object->_libraryVersion = nil;
    [object setLibraryVersion:[self libraryVersion]];
    object->_networkHeavyRotationKey = nil;
    [object setNetworkHeavyRotationKey:[self networkHeavyRotationKey]];
    object->_playlistsURL = nil;
    [object setPlaylistsURL:[self playlistsURL]];
    object->_profileURL = nil;
    [object setProfileURL:[self profileURL]];
    object->_subscriber = NO;
    [object setSubscriber:[self isSubscriber]];
    object->_trackCount = nil;
    [object setTrackCount:[self trackCount]];
    object->_trial = NO;
    [object setTrial:[self isTrial]];
    object->_unlimited = NO;
    [object setUnlimited:[self isUnlimited]];
    object->_userName = nil;
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
