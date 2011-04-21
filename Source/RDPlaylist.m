//
//  RDPlaylist.m
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

#import "RDPlaylist.h"
#import "RDConstants.h"
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

NSString *kRDPlaylistBaseIcon = @"baseIcon";
NSString *kRDPlaylistEmbedURL = @"embedURL";
NSString *kRDPlaylistIconURL = @"iconURL";
NSString *kRDPlaylistLastUpdated = @"lastUpdated";
NSString *kRDPlaylistName = @"name";
NSString *kRDPlaylistProfileURL = @"profileURL";
NSString *kRDPlaylistShortURL = @"shortURL";
NSString *kRDPlaylistTrackCount = @"trackCount";
NSString *kRDPlaylistUserDisplayName = @"userDisplayName";
NSString *kRDPlaylistUserIconURL = @"userIconURL";
NSString *kRDPlaylistUserKey = @"userKey";
NSString *kRDPlaylistUserProfileURL = @"userProfileURL";


#pragma mark -

@implementation RDPlaylist

#pragma mark -
#pragma mark Properties

@synthesize _baseIcon;
@synthesize _embedURL;
@synthesize _iconURL;
@synthesize _lastUpdated;
@synthesize _name;
@synthesize _profileURL;
@synthesize _shortURL;
@synthesize _trackCount;
@synthesize _userDisplayName;
@synthesize _userIconURL;
@synthesize _userKey;
@synthesize _userProfileURL;

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

    id aEmbedURL = [aDictionary objectForKey:@"embedUrl"];
    if ([aEmbedURL isKindOfClass:[NSString class]])
    {
        _embedURL = [[NSURL alloc] initWithString:aEmbedURL];
    }
    if ([aEmbedURL isKindOfClass:[NSURL class]])
    {
        _embedURL = [(NSURL *)aEmbedURL retain];
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

    id aLastUpdated = [aDictionary objectForKey:@"lastUpdated"];
    if ([aLastUpdated isKindOfClass:[NSDate class]])
    {
        _lastUpdated = [(NSDate *)aLastUpdated retain];
    }
    else if ([aLastUpdated isKindOfClass:[NSNumber class]])
    {
        _lastUpdated = [[NSDate alloc] initWithTimeIntervalSince1970:[(NSNumber *)aLastUpdated doubleValue]];
    }

    id aName = [aDictionary objectForKey:@"name"];
    if ([aName isKindOfClass:[NSString class]])
    {
        _name = [(NSString *)aName copy];
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

    id aShortURL = [aDictionary objectForKey:@"shortUrl"];
    if ([aShortURL isKindOfClass:[NSString class]])
    {
        _shortURL = [[NSURL alloc] initWithString:aShortURL];
    }
    if ([aShortURL isKindOfClass:[NSURL class]])
    {
        _shortURL = [(NSURL *)aShortURL retain];
    }

    id aTrackCount = [aDictionary objectForKey:@"length"];
    if ([aTrackCount isKindOfClass:[NSNumber class]])
    {
        _trackCount = [(NSNumber *)aTrackCount retain];
    }
    else if ([aTrackCount isKindOfClass:[NSString class]])
    {
        _trackCount = [[numberFormatter numberFromString:(NSString *)aTrackCount] retain];
    }

    id aUserDisplayName = [aDictionary objectForKey:@"owner"];
    if ([aUserDisplayName isKindOfClass:[NSString class]])
    {
        _userDisplayName = [(NSString *)aUserDisplayName copy];
    }

    id aUserIconURL = [aDictionary objectForKey:@"ownerIcon"];
    if ([aUserIconURL isKindOfClass:[NSString class]])
    {
        _userIconURL = [[NSURL alloc] initWithString:aUserIconURL];
    }
    if ([aUserIconURL isKindOfClass:[NSURL class]])
    {
        _userIconURL = [(NSURL *)aUserIconURL retain];
    }

    id aUserKey = [aDictionary objectForKey:@"ownerKey"];
    if ([aUserKey isKindOfClass:[NSString class]])
    {
        _userKey = [(NSString *)aUserKey copy];
    }

    id aUserProfileURL = [aDictionary objectForKey:@"ownerUrl"];
    if ([aUserProfileURL isKindOfClass:[NSString class]])
    {
        _userProfileURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", RDWebsiteBaseURLString, (NSString *)aUserProfileURL]];
    }
    if ([aUserProfileURL isKindOfClass:[NSURL class]])
    {
        _userProfileURL = [(NSURL *)aUserProfileURL retain];
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
    [_embedURL release];
    _embedURL = nil;
    [_iconURL release];
    _iconURL = nil;
    [_lastUpdated release];
    _lastUpdated = nil;
    [_name release];
    _name = nil;
    [_profileURL release];
    _profileURL = nil;
    [_shortURL release];
    _shortURL = nil;
    [_trackCount release];
    _trackCount = nil;
    [_userDisplayName release];
    _userDisplayName = nil;
    [_userProfileURL release];
    _userProfileURL = nil;
    [_userKey release];
    _userKey = nil;
    [_userIconURL release];
    _userIconURL = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];

    [encoder encodeObject:_baseIcon forKey:kRDPlaylistBaseIcon];
    [encoder encodeObject:_embedURL forKey:kRDPlaylistEmbedURL];
    [encoder encodeObject:_iconURL forKey:kRDPlaylistIconURL];
    [encoder encodeObject:_lastUpdated forKey:kRDPlaylistLastUpdated];
    [encoder encodeObject:_name forKey:kRDPlaylistName];
    [encoder encodeObject:_profileURL forKey:kRDPlaylistProfileURL];
    [encoder encodeObject:_shortURL forKey:kRDPlaylistShortURL];
    [encoder encodeObject:_trackCount forKey:kRDPlaylistTrackCount];
    [encoder encodeObject:_userDisplayName forKey:kRDPlaylistUserDisplayName];
    [encoder encodeObject:_userIconURL forKey:kRDPlaylistUserIconURL];
    [encoder encodeObject:_userKey forKey:kRDPlaylistUserKey];
    [encoder encodeObject:_userProfileURL forKey:kRDPlaylistUserProfileURL];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (!(self = [self initWithCoder:decoder])) return nil;

    _baseIcon = [decoder decodeObjectForKey:kRDPlaylistBaseIcon];
    _embedURL = [decoder decodeObjectForKey:kRDPlaylistEmbedURL];
    _iconURL = [decoder decodeObjectForKey:kRDPlaylistIconURL];
    _lastUpdated = [decoder decodeObjectForKey:kRDPlaylistLastUpdated];
    _name = [decoder decodeObjectForKey:kRDPlaylistName];
    _profileURL = [decoder decodeObjectForKey:kRDPlaylistProfileURL];
    _shortURL = [decoder decodeObjectForKey:kRDPlaylistShortURL];
    _trackCount = [decoder decodeObjectForKey:kRDPlaylistTrackCount];
    _userDisplayName = [decoder decodeObjectForKey:kRDPlaylistUserDisplayName];
    _userIconURL = [decoder decodeObjectForKey:kRDPlaylistUserIconURL];
    _userKey = [decoder decodeObjectForKey:kRDPlaylistUserKey];
    _userProfileURL = [decoder decodeObjectForKey:kRDPlaylistUserProfileURL];

    return self;
}

#pragma mark -
#pragma mark NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone
{
    RDPlaylist *object = [super copyWithZone:zone];

    object->_baseIcon = nil;
    [object setBaseIcon:[self baseIcon]];
    object->_embedURL = nil;
    [object setEmbedURL:[self embedURL]];
    object->_iconURL = nil;
    [object setIconURL:[self iconURL]];
    object->_lastUpdated = nil;
    [object setLastUpdated:[self lastUpdated]];
    object->_name = nil;
    [object setName:[self name]];
    object->_profileURL = nil;
    [object setProfileURL:[self profileURL]];
    object->_shortURL = nil;
    [object setShortURL:[self shortURL]];
    object->_trackCount = nil;
    [object setTrackCount:[self trackCount]];
    object->_userDisplayName = nil;
    [object setUserDisplayName:[self userDisplayName]];
    object->_userIconURL = nil;
    [object setUserIconURL:[self userIconURL]];
    object->_userKey = nil;
    [object setUserKey:[self userKey]];
    object->_userProfileURL = nil;
    [object setUserProfileURL:[self userProfileURL]];

    return object;
}

#pragma mark -
#pragma mark NSObject Protocol

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self key]];
}

@end
