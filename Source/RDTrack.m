//
//  RDTrack.m
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

#import "RDTrack.h"
#import "RDConstants.h"
#import <Foundation/NSCoder.h>
#import <Foundation/NSDecimalNumber.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSLocale.h>
#import <Foundation/NSNumberFormatter.h>
#import <Foundation/NSString.h>
#import <Foundation/NSURL.h>


#pragma mark -
#pragma mark Constants

NSString *kRDTrackAlbumArtistKey = @"albumArtistKey";
NSString *kRDTrackAlbumArtistName = @"albumArtistName";
NSString *kRDTrackAlbumKey = @"albumKey";
NSString *kRDTrackAlbumName = @"albumName";
NSString *kRDTrackAlbumURL = @"albumURL";
NSString *kRDTrackArtistKey = @"artistKey";
NSString *kRDTrackArtistName = @"artistName";
NSString *kRDTrackArtistURL = @"artistURL";
NSString *kRDTrackBaseIcon = @"baseIcon";
NSString *kRDTrackClean = @"clean";
NSString *kRDTrackDownloadable = @"downloadable";
NSString *kRDTrackDownloadableAlbumOnly = @"downloadableAlbumOnly";
NSString *kRDTrackDuration = @"duration";
NSString *kRDTrackEmbedURL = @"embedURL";
NSString *kRDTrackExplicit = @"explicit";
NSString *kRDTrackIconURL = @"iconURL";
NSString *kRDTrackIconLargeURL = @"iconLargeURL";
NSString *kRDTrackLength = @"length";
NSString *kRDTrackName = @"name";
NSString *kRDTrackOnCompilation = @"onCompilation";
NSString *kRDTrackPlayCount = @"playCount";
NSString *kRDTrackPrice = @"price";
NSString *kRDTrackProfileURL = @"profileURL";
NSString *kRDTrackSampleable = @"sampleable";
NSString *kRDTrackShortURL = @"shortURL";
NSString *kRDTrackStreamable = @"streamable";
NSString *kRDTrackSyncable = @"syncable";
NSString *kRDTrackTrackNumber = @"trackNumber";

#pragma mark -

@implementation RDTrack

#pragma mark -
#pragma mark Properties

@synthesize _albumArtistKey;
@synthesize _albumArtistName;
@synthesize _albumKey;
@synthesize _albumName;
@synthesize _albumURL;
@synthesize _artistKey;
@synthesize _artistName;
@synthesize _artistURL;
@synthesize _baseIcon;
@synthesize _clean;
@synthesize _downloadable;
@synthesize _downloadableAlbumOnly;
@synthesize _duration;
@synthesize _embedURL;
@synthesize _explicit;
@synthesize _iconURL;
@synthesize _iconLargeURL;
@synthesize _length;
@synthesize _name;
@synthesize _onCompilation;
@synthesize _playCount;
@synthesize _price;
@synthesize _profileURL;
@synthesize _sampleable;
@synthesize _shortURL;
@synthesize _streamable;
@synthesize _syncable;
@synthesize _trackNumber;

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

    id aAlbumArtistKey = [aDictionary objectForKey:@"albumArtistKey"];
    if ([aAlbumArtistKey isKindOfClass:[NSString class]])
    {
        _albumArtistKey = [(NSString *)aAlbumArtistKey copy];
    }

    id aAlbumArtistName = [aDictionary objectForKey:@"albumArtist"];
    if ([aAlbumArtistName isKindOfClass:[NSString class]])
    {
        _albumArtistName = [(NSString *)aAlbumArtistName copy];
    }

    id aAlbumKey = [aDictionary objectForKey:@"albumKey"];
    if ([aAlbumKey isKindOfClass:[NSString class]])
    {
        _albumKey = [(NSString *)aAlbumKey copy];
    }

    id aAlbumName = [aDictionary objectForKey:@"album"];
    if ([aAlbumName isKindOfClass:[NSString class]])
    {
        _albumName = [(NSString *)aAlbumName copy];
    }

    id aAlbumURL = [aDictionary objectForKey:@"albumUrl"];
    if ([aAlbumURL isKindOfClass:[NSString class]])
    {
        _albumURL = [[NSURL alloc] initWithString:aAlbumURL];
    }
    if ([aAlbumURL isKindOfClass:[NSURL class]])
    {
        _albumURL = [(NSURL *)aAlbumURL retain];
    }

    id aArtistKey = [aDictionary objectForKey:@"artistKey"];
    if ([aArtistKey isKindOfClass:[NSString class]])
    {
        _artistKey = [(NSString *)aArtistKey copy];
    }

    id aArtistName = [aDictionary objectForKey:@"artist"];
    if ([aArtistName isKindOfClass:[NSString class]])
    {
        _artistName = [(NSString *)aArtistName copy];
    }

    id aArtistURL = [aDictionary objectForKey:@"artistUrl"];
    if ([aArtistURL isKindOfClass:[NSString class]])
    {
        _artistURL = [[NSURL alloc] initWithString:aArtistURL];
    }
    if ([aArtistURL isKindOfClass:[NSURL class]])
    {
        _artistURL = [(NSURL *)aArtistURL retain];
    }

    id aBaseIcon = [aDictionary objectForKey:@"baseIcon"];
    if ([aBaseIcon isKindOfClass:[NSString class]])
    {
        _baseIcon = [(NSString *)aBaseIcon copy];
    }

    id aClean = [aDictionary objectForKey:@"duration"];
    if ([aClean isKindOfClass:[NSNumber class]])
    {
        _clean = [(NSNumber *)aClean boolValue];
    }

    id aDownloadable = [aDictionary objectForKey:@"canDownload"];
    if ([aDownloadable isKindOfClass:[NSNumber class]])
    {
        _downloadable = [(NSNumber *)aDownloadable boolValue];
    }

    id aDownloadableAlbumOnly = [aDictionary objectForKey:@"canDownloadAlbumOnly"];
    if ([aDownloadableAlbumOnly isKindOfClass:[NSNumber class]])
    {
        _downloadableAlbumOnly = [(NSNumber *)aDownloadableAlbumOnly boolValue];
    }

    id aDuration = [aDictionary objectForKey:@"duration"];
    if ([aDuration isKindOfClass:[NSNumber class]])
    {
        _duration = [(NSNumber *)aDuration retain];
    }
    else if ([aDuration isKindOfClass:[NSString class]])
    {
        _duration = [[numberFormatter numberFromString:(NSString *)aDuration] retain];
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

    id aExplicit = [aDictionary objectForKey:@"isExplicit"];
    if ([aExplicit isKindOfClass:[NSNumber class]])
    {
        _explicit = [(NSNumber *)aExplicit boolValue];
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

    id aIconLargeURL = [aDictionary objectForKey:@"bigIcon"];
    if ([aIconLargeURL isKindOfClass:[NSString class]])
    {
        _iconLargeURL = [[NSURL alloc] initWithString:aIconLargeURL];
    }
    if ([aIconLargeURL isKindOfClass:[NSURL class]])
    {
        _iconLargeURL = [(NSURL *)aIconLargeURL retain];
    }

    id aLength = [aDictionary objectForKey:@"length"];
    if ([aLength isKindOfClass:[NSNumber class]])
    {
        _length = [(NSNumber *)aLength retain];
    }
    else if ([aLength isKindOfClass:[NSString class]])
    {
        _length = [[numberFormatter numberFromString:(NSString *)aLength] retain];
    }

    id aName = [aDictionary objectForKey:@"name"];
    if ([aName isKindOfClass:[NSString class]])
    {
        _name = [(NSString *)aName copy];
    }

    id aOnCompilation = [aDictionary objectForKey:@"isOnCompilation"];
    if ([aOnCompilation isKindOfClass:[NSNumber class]])
    {
        _onCompilation = [(NSNumber *)aOnCompilation boolValue];
    }

    id aPlayCount = [aDictionary objectForKey:@"playCount"];
    if ([aPlayCount isKindOfClass:[NSNumber class]])
    {
        _playCount = [(NSNumber *)aPlayCount retain];
    }
    else if ([aPlayCount isKindOfClass:[NSString class]])
    {
        _playCount = [[numberFormatter numberFromString:(NSString *)aPlayCount] retain];
    }

    id aPrice = [aDictionary objectForKey:@"price"];
    if ([aPrice isKindOfClass:[NSNumber class]])
    {
        _price = [(NSNumber *)aPrice retain];
    }
    else if ([aPrice isKindOfClass:[NSString class]])
    {
        _price = [[numberFormatter numberFromString:(NSString *)aPrice] retain];
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

    id aSampleable = [aDictionary objectForKey:@"canSample"];
    if ([aSampleable isKindOfClass:[NSNumber class]])
    {
        _sampleable = [(NSNumber *)aSampleable boolValue];
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

    id aStreamable = [aDictionary objectForKey:@"canStream"];
    if ([aStreamable isKindOfClass:[NSNumber class]])
    {
        _streamable = [(NSNumber *)aStreamable boolValue];
    }

    id aSyncable = [aDictionary objectForKey:@"canTether"];
    if ([aSyncable isKindOfClass:[NSNumber class]])
    {
        _syncable = [(NSNumber *)aSyncable boolValue];
    }

    id aTrackNumber = [aDictionary objectForKey:@"trackNum"];
    if ([aTrackNumber isKindOfClass:[NSNumber class]])
    {
        _trackNumber = [(NSNumber *)aTrackNumber retain];
    }
    else if ([aTrackNumber isKindOfClass:[NSString class]])
    {
        _trackNumber = [[numberFormatter numberFromString:(NSString *)aTrackNumber] retain];
    }

    [numberFormatter release];

    return self;
}

#pragma mark -
#pragma mark Deallocation

- (void)dealloc
{
    [_albumArtistKey release];
    _albumArtistKey = nil;
    [_albumArtistName release];
    _albumArtistName = nil;
    [_albumKey release];
    _albumKey = nil;
    [_albumName release];
    _albumName = nil;
    [_albumURL release];
    _albumURL = nil;
    [_artistKey release];
    _artistKey = nil;
    [_artistName release];
    _artistName = nil;
    [_artistURL release];
    _artistURL = nil;
    [_baseIcon release];
    _baseIcon = nil;
    _clean = NO;
    _downloadable = NO;
    _downloadableAlbumOnly = NO;
    [_duration release];
    _duration = nil;
    [_embedURL release];
    _embedURL = nil;
    _explicit = NO;
    [_iconURL release];
    _iconURL = nil;
    [_iconLargeURL release];
    _iconLargeURL = nil;
    [_length release];
    _length = nil;
    [_name release];
    _name = nil;
    _onCompilation = NO;
    [_playCount release];
    _playCount = nil;
    [_price release];
    _price = nil;
    [_profileURL release];
    _profileURL = nil;
    _sampleable = NO;
    [_shortURL release];
    _shortURL = nil;
    _streamable = NO;
    _syncable = NO;
    [_trackNumber release];
    _trackNumber = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];

    [encoder encodeObject:_albumArtistKey forKey:kRDTrackAlbumArtistKey];
    [encoder encodeObject:_albumArtistName forKey:kRDTrackAlbumArtistName];
    [encoder encodeObject:_albumKey forKey:kRDTrackAlbumKey];
    [encoder encodeObject:_albumName forKey:kRDTrackAlbumName];
    [encoder encodeObject:_albumURL forKey:kRDTrackAlbumURL];
    [encoder encodeObject:_artistKey forKey:kRDTrackArtistKey];
    [encoder encodeObject:_artistName forKey:kRDTrackArtistName];
    [encoder encodeObject:_artistURL forKey:kRDTrackArtistURL];
    [encoder encodeObject:_baseIcon forKey:kRDTrackBaseIcon];
    [encoder encodeBool:_clean forKey:kRDTrackClean];
    [encoder encodeBool:_downloadable forKey:kRDTrackDownloadable];
    [encoder encodeBool:_downloadableAlbumOnly forKey:kRDTrackDownloadableAlbumOnly];
    [encoder encodeObject:_duration forKey:kRDTrackDuration];
    [encoder encodeObject:_embedURL forKey:kRDTrackEmbedURL];
    [encoder encodeBool:_explicit forKey:kRDTrackExplicit];
    [encoder encodeObject:_iconURL forKey:kRDTrackIconURL];
    [encoder encodeObject:_iconLargeURL forKey:kRDTrackIconLargeURL];
    [encoder encodeObject:_length forKey:kRDTrackLength];
    [encoder encodeObject:_name forKey:kRDTrackName];
    [encoder encodeBool:_onCompilation forKey:kRDTrackOnCompilation];
    [encoder encodeObject:_playCount forKey:kRDTrackPlayCount];
    [encoder encodeObject:_price forKey:kRDTrackPrice];
    [encoder encodeObject:_profileURL forKey:kRDTrackProfileURL];
    [encoder encodeBool:_sampleable forKey:kRDTrackSampleable];
    [encoder encodeObject:_shortURL forKey:kRDTrackShortURL];
    [encoder encodeBool:_streamable forKey:kRDTrackStreamable];
    [encoder encodeBool:_syncable forKey:kRDTrackSyncable];
    [encoder encodeObject:_trackNumber forKey:kRDTrackTrackNumber];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (!(self = [self initWithCoder:decoder])) return nil;

    _albumArtistKey = [decoder decodeObjectForKey:kRDTrackAlbumArtistKey];
    _albumArtistName = [decoder decodeObjectForKey:kRDTrackAlbumArtistName];
    _albumKey = [decoder decodeObjectForKey:kRDTrackAlbumKey];
    _albumName = [decoder decodeObjectForKey:kRDTrackAlbumName];
    _albumURL = [decoder decodeObjectForKey:kRDTrackAlbumURL];
    _artistKey = [decoder decodeObjectForKey:kRDTrackArtistKey];
    _artistName = [decoder decodeObjectForKey:kRDTrackArtistName];
    _artistURL = [decoder decodeObjectForKey:kRDTrackArtistURL];
    _baseIcon = [decoder decodeObjectForKey:kRDTrackBaseIcon];
    _clean = [decoder decodeBoolForKey:kRDTrackClean];
    _downloadable = [decoder decodeBoolForKey:kRDTrackDownloadable];
    _downloadableAlbumOnly = [decoder decodeBoolForKey:kRDTrackDownloadableAlbumOnly];
    _duration = [decoder decodeObjectForKey:kRDTrackDuration];
    _embedURL = [decoder decodeObjectForKey:kRDTrackEmbedURL];
    _explicit = [decoder decodeBoolForKey:kRDTrackExplicit];
    _iconURL = [decoder decodeObjectForKey:kRDTrackIconURL];
    _iconLargeURL = [decoder decodeObjectForKey:kRDTrackIconLargeURL];
    _length = [decoder decodeObjectForKey:kRDTrackLength];
    _name = [decoder decodeObjectForKey:kRDTrackName];
    _onCompilation = [decoder decodeBoolForKey:kRDTrackOnCompilation];
    _playCount = [decoder decodeObjectForKey:kRDTrackPlayCount];
    _price = [decoder decodeObjectForKey:kRDTrackPrice];
    _profileURL = [decoder decodeObjectForKey:kRDTrackProfileURL];
    _sampleable = [decoder decodeBoolForKey:kRDTrackSampleable];
    _shortURL = [decoder decodeObjectForKey:kRDTrackShortURL];
    _streamable = [decoder decodeBoolForKey:kRDTrackStreamable];
    _syncable = [decoder decodeBoolForKey:kRDTrackSyncable];
    _trackNumber = [decoder decodeObjectForKey:kRDTrackTrackNumber];

    return self;
}

#pragma mark -
#pragma mark NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone
{
    RDTrack *object = [super copyWithZone:zone];

    object->_albumArtistKey = nil;
    [object setAlbumArtistKey:[self albumArtistKey]];
    object->_albumArtistName = nil;
    [object setAlbumArtistName:[self albumArtistName]];
    object->_albumKey = nil;
    [object setAlbumKey:[self albumKey]];
    object->_albumName = nil;
    [object setAlbumName:[self albumName]];
    object->_albumURL = nil;
    [object setAlbumURL:[self albumURL]];
    object->_artistKey = nil;
    [object setArtistKey:[self artistKey]];
    object->_artistName = nil;
    [object setArtistName:[self artistName]];
    object->_artistURL = nil;
    [object setArtistURL:[self artistURL]];
    object->_baseIcon = nil;
    [object setBaseIcon:[self baseIcon]];
    object->_clean = NO;
    [object setClean:[self isClean]];
    object->_downloadable = NO;
    [object setDownloadable:[self isDownloadable]];
    object->_downloadableAlbumOnly = NO;
    [object setDownloadableAlbumOnly:[self isDownloadableAlbumOnly]];
    object->_duration = nil;
    [object setDuration:[self duration]];
    object->_embedURL = nil;
    [object setEmbedURL:[self embedURL]];
    object->_explicit = NO;
    [object setExplicit:[self isExplicit]];
    object->_iconURL = nil;
    [object setIconURL:[self iconURL]];
    object->_iconLargeURL = nil;
    [object setIconLargeURL:[self iconLargeURL]];
    object->_length = nil;
    [object setLength:[self length]];
    object->_name = nil;
    [object setName:[self name]];
    object->_onCompilation = NO;
    [object setOnCompilation:[self isOnCompilation]];
    object->_playCount = nil;
    [object setPlayCount:[self playCount]];
    object->_price = nil;
    [object setPrice:[self price]];
    object->_profileURL = nil;
    [object setProfileURL:[self profileURL]];
    object->_sampleable = NO;
    [object setSampleable:[self isSampleable]];
    object->_shortURL = nil;
    [object setShortURL:[self shortURL]];
    object->_streamable = NO;
    [object setStreamable:[self isStreamable]];
    object->_syncable = NO;
    [object setSyncable:[self isSyncable]];
    object->_trackNumber = nil;
    [object setTrackNumber:[self trackNumber]];

    return object;
}

#pragma mark -
#pragma mark NSObject Protocol

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self key]];
}

@end
