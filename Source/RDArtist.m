//
//  RDArtist.m
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

#import "RDArtist.h"
#import "RDConstants.h"
#import <Foundation/NSCoder.h>
#import <Foundation/NSDecimalNumber.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSLocale.h>
#import <Foundation/NSNumberFormatter.h>
#import <Foundation/NSString.h>


#pragma mark -
#pragma mark Constants

NSString *kRDArtistAlbumCount = @"albumCount";
NSString *kRDArtistBaseIcon = @"baseIcon";
NSString *kRDArtistIconURL = @"iconURL";
NSString *kRDArtistName = @"name";
NSString *kRDArtistProfileURL = @"profileURL";
NSString *kRDArtistRadioStationAvailable = @"radioStationAvailable";
NSString *kRDArtistShortURL = @"shortURL";
NSString *kRDArtistTrackCount = @"trackCount";

#pragma mark -

@implementation RDArtist

#pragma mark -
#pragma mark Properties

@synthesize _albumCount;
@synthesize _baseIcon;
@synthesize _iconURL;
@synthesize _name;
@synthesize _profileURL;
@synthesize _radioStationAvailable;
@synthesize _shortURL;
@synthesize _trackCount;

#pragma mark -
#pragma mark Initialization

- (id)initWithDictionary:(NSDictionary *)aDictionary
{
    if (!(self = [super initWithDictionary:aDictionary])) return nil;

    NSLocale *locale = [[NSLocale alloc]
        initWithLocaleIdentifier:RDWebServiceLocaleIdentifier];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setLocale:locale];
    [locale release];

    id aAlbumCount = [aDictionary objectForKey:@"album_count"];
    if ([aAlbumCount isKindOfClass:[NSNumber class]])
    {
        _albumCount = [(NSNumber *)aAlbumCount retain];
    }
    else if ([aAlbumCount isKindOfClass:[NSString class]])
    {
        _albumCount = [[numberFormatter numberFromString:(NSString *)aAlbumCount] retain];
    }

    id aBaseIcon = [aDictionary objectForKey:@"baseIcon"];
    if ([aBaseIcon isKindOfClass:[NSString class]])
    {
        _baseIcon = [(NSString *)aBaseIcon copy];
    }

    id aIconURL = [aDictionary objectForKey:@"icon"];
    if ([aIconURL isKindOfClass:[NSString class]])
    {
        _iconURL = [[NSURL alloc] initWithString:(NSString *)aIconURL];
    }
    if ([aIconURL isKindOfClass:[NSURL class]])
    {
        _iconURL = [(NSURL *)aIconURL retain];
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

    id aRadioStationAvailable = [aDictionary objectForKey:@"hasRadio"];
    if ([aRadioStationAvailable isKindOfClass:[NSNumber class]])
    {
        _radioStationAvailable = [(NSNumber *)aRadioStationAvailable boolValue];
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

    [numberFormatter release];

    return self;
}

#pragma mark -
#pragma mark Deallocation

- (void)dealloc
{
    [_albumCount release];
    _albumCount = nil;
    [_baseIcon release];
    _baseIcon = nil;
    [_iconURL release];
    _iconURL = nil;
    [_name release];
    _name = nil;
    [_profileURL release];
    _profileURL = nil;
    _radioStationAvailable = NO;
    [_shortURL release];
    _shortURL = nil;
    [_trackCount release];
    _trackCount = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];

    [encoder encodeObject:_albumCount forKey:kRDArtistAlbumCount];
    [encoder encodeObject:_baseIcon forKey:kRDArtistBaseIcon];
    [encoder encodeObject:_iconURL forKey:kRDArtistIconURL];
    [encoder encodeObject:_name forKey:kRDArtistName];
    [encoder encodeObject:_profileURL forKey:kRDArtistProfileURL];
    [encoder encodeBool:_radioStationAvailable forKey:kRDArtistRadioStationAvailable];
    [encoder encodeObject:_shortURL forKey:kRDArtistShortURL];
    [encoder encodeObject:_trackCount forKey:kRDArtistTrackCount];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (!(self = [self initWithCoder:decoder])) return nil;

    _albumCount = [decoder decodeObjectForKey:kRDArtistAlbumCount];
    _baseIcon = [decoder decodeObjectForKey:kRDArtistBaseIcon];
    _iconURL = [decoder decodeObjectForKey:kRDArtistIconURL];
    _name = [decoder decodeObjectForKey:kRDArtistName];
    _profileURL = [decoder decodeObjectForKey:kRDArtistIconURL];
    _radioStationAvailable = [decoder decodeBoolForKey:kRDArtistRadioStationAvailable];
    _shortURL = [decoder decodeObjectForKey:kRDArtistShortURL];
    _trackCount = [decoder decodeObjectForKey:kRDArtistTrackCount];

    return self;
}

#pragma mark -
#pragma mark NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone
{
    RDArtist *object = [super copyWithZone:zone];

    object->_albumCount = nil;
    [object setAlbumCount:[self albumCount]];
    object->_baseIcon = nil;
    [object setBaseIcon:[self baseIcon]];
    object->_iconURL = nil;
    [object setIconURL:[self iconURL]];
    object->_name = nil;
    [object setName:[self name]];
    object->_profileURL = nil;
    [object setProfileURL:[self profileURL]];
    object->_radioStationAvailable = NO;
    [object setRadioStationAvailable:[self isRadioStationAvailable]];
    object->_shortURL = nil;
    [object setShortURL:[self shortURL]];
    object->_trackCount = nil;
    [object setTrackCount:[self trackCount]];

    return object;
}

#pragma mark -
#pragma mark NSObject Protocol

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self name]];
}

@end
