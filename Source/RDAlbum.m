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

#import "RDAlbum.h"
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

NSString *kRDAlbumArtistKey = @"artistKey";
NSString *kRDAlbumArtistName = @"artistName";
NSString *kRDAlbumArtistURL = @"artistURL";
NSString *kRDAlbumBaseIcon = @"baseIcon";
NSString *kRDAlbumClean = @"clean";
NSString *kRDAlbumCompilation = @"compilation";
NSString *kRDAlbumDownloadable = @"downloadable";
NSString *kRDAlbumDownloadableAlbumOnly = @"downloadableAlbumOnly";
NSString *kRDAlbumDuration = @"duration";
NSString *kRDAlbumEmbedURL = @"embedURL";
NSString *kRDAlbumExplicit = @"explicit";
NSString *kRDAlbumIconURL = @"iconURL";
NSString *kRDAlbumIconLargeURL = @"iconLargeURL";
NSString *kRDAlbumName = @"name";
NSString *kRDAlbumPlayCount = @"playCount";
NSString *kRDAlbumPrice = @"price";
NSString *kRDAlbumProfileURL = @"profileURL";
NSString *kRDAlbumReleaseDate = @"releaseDate";
NSString *kRDAlbumSampleable = @"sampleable";
NSString *kRDAlbumShortURL = @"shortURL";
NSString *kRDAlbumStreamable = @"streamable";
NSString *kRDAlbumSyncable = @"syncable";
NSString *kRDAlbumTrackCount = @"trackCount";
NSString *kRDAlbumTrackKeys = @"trackKeys";

#pragma mark -

@implementation RDAlbum

#pragma mark -
#pragma mark Properties

@synthesize _artistKey;
@synthesize _artistName;
@synthesize _artistURL;
@synthesize _baseIcon;
@synthesize _clean;
@synthesize _compilation;
@synthesize _downloadable;
@synthesize _downloadableAlbumOnly;
@synthesize _duration;
@synthesize _embedURL;
@synthesize _explicit;
@synthesize _iconURL;
@synthesize _iconLargeURL;
@synthesize _name;
@synthesize _playCount;
@synthesize _price;
@synthesize _profileURL;
@synthesize _releaseDate;
@synthesize _sampleable;
@synthesize _shortURL;
@synthesize _streamable;
@synthesize _syncable;
@synthesize _trackCount;
@synthesize _trackKeys;

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

    id aCompilation = [aDictionary objectForKey:@"isCompilation"];
    if ([aCompilation isKindOfClass:[NSNumber class]])
    {
        _compilation = [(NSNumber *)aCompilation boolValue];
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

    id aName = [aDictionary objectForKey:@"name"];
    if ([aName isKindOfClass:[NSString class]])
    {
        _name = [(NSString *)aName copy];
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

    id aReleaseDate = [aDictionary objectForKey:@"releaseDate"];
    if ([aReleaseDate isKindOfClass:[NSDate class]])
    {
        _releaseDate = [(NSDate *)aReleaseDate retain];
    }
    else if ([aReleaseDate isKindOfClass:[NSString class]])
    {
        //ISO 8601 Date representation
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        _releaseDate = [[dateFormatter dateFromString:(NSString *)aReleaseDate] retain];
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

    id aTrackCount = [aDictionary objectForKey:@"length"];
    if ([aTrackCount isKindOfClass:[NSNumber class]])
    {
        _trackCount = [(NSNumber *)aTrackCount retain];
    }
    else if ([aTrackCount isKindOfClass:[NSString class]])
    {
        _trackCount = [[numberFormatter numberFromString:(NSString *)aTrackCount] retain];
    }

    id aTrackKeys = [aDictionary objectForKey:@"trackKeys"];
    if ([aTrackKeys isKindOfClass:[NSArray class]])
    {
        _trackKeys = [(NSArray *)aTrackKeys copy];
    }

    [dateFormatter release];
    [numberFormatter release];

    return self;
}

#pragma mark -
#pragma mark Deallocation

- (void)dealloc
{
    [_artistKey release];
    _artistKey = nil;
    [_artistName release];
    _artistName = nil;
    [_artistURL release];
    _artistURL = nil;
    [_baseIcon release];
    _baseIcon = nil;
    _clean = NO;
    _compilation = NO;
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
    [_name release];
    _name = nil;
    [_playCount release];
    _playCount = nil;
    [_price release];
    _price = nil;
    [_profileURL release];
    _profileURL = nil;
    [_releaseDate release];
    _releaseDate = nil;
    _sampleable = NO;
    [_shortURL release];
    _shortURL = nil;
    _streamable = NO;
    _syncable = NO;
    [_trackCount release];
    _trackCount = nil;
    [_trackKeys release];
    _trackKeys = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];

    [encoder encodeObject:_artistKey forKey:kRDAlbumArtistKey];
    [encoder encodeObject:_artistName forKey:kRDAlbumArtistName];
    [encoder encodeObject:_artistURL forKey:kRDAlbumArtistURL];
    [encoder encodeObject:_baseIcon forKey:kRDAlbumBaseIcon];
    [encoder encodeBool:_clean forKey:kRDAlbumClean];
    [encoder encodeBool:_compilation forKey:kRDAlbumCompilation];
    [encoder encodeBool:_downloadable forKey:kRDAlbumDownloadable];
    [encoder encodeBool:_downloadableAlbumOnly forKey:kRDAlbumDownloadableAlbumOnly];
    [encoder encodeObject:_duration forKey:kRDAlbumDuration];
    [encoder encodeObject:_embedURL forKey:kRDAlbumEmbedURL];
    [encoder encodeBool:_explicit forKey:kRDAlbumExplicit];
    [encoder encodeObject:_iconURL forKey:kRDAlbumIconURL];
    [encoder encodeObject:_iconLargeURL forKey:kRDAlbumIconLargeURL];
    [encoder encodeObject:_name forKey:kRDAlbumName];
    [encoder encodeObject:_playCount forKey:kRDAlbumPlayCount];
    [encoder encodeObject:_price forKey:kRDAlbumPrice];
    [encoder encodeObject:_profileURL forKey:kRDAlbumProfileURL];
    [encoder encodeObject:_releaseDate forKey:kRDAlbumReleaseDate];
    [encoder encodeBool:_sampleable forKey:kRDAlbumSampleable];
    [encoder encodeObject:_shortURL forKey:kRDAlbumShortURL];
    [encoder encodeBool:_streamable forKey:kRDAlbumStreamable];
    [encoder encodeBool:_syncable forKey:kRDAlbumSyncable];
    [encoder encodeObject:_trackCount forKey:kRDAlbumTrackCount];
    [encoder encodeObject:_trackKeys forKey:kRDAlbumTrackKeys];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (!(self = [self initWithCoder:decoder])) return nil;

    _artistKey = [decoder decodeObjectForKey:kRDAlbumArtistKey];
    _artistName = [decoder decodeObjectForKey:kRDAlbumArtistName];
    _artistURL = [decoder decodeObjectForKey:kRDAlbumArtistURL];
    _baseIcon = [decoder decodeObjectForKey:kRDAlbumBaseIcon];
    _clean = [decoder decodeBoolForKey:kRDAlbumClean];
    _compilation = [decoder decodeBoolForKey:kRDAlbumCompilation];
    _downloadable = [decoder decodeBoolForKey:kRDAlbumDownloadable];
    _downloadableAlbumOnly = [decoder decodeBoolForKey:kRDAlbumDownloadableAlbumOnly];
    _duration = [decoder decodeObjectForKey:kRDAlbumDuration];
    _embedURL = [decoder decodeObjectForKey:kRDAlbumEmbedURL];
    _explicit = [decoder decodeBoolForKey:kRDAlbumExplicit];
    _iconURL = [decoder decodeObjectForKey:kRDAlbumIconURL];
    _iconLargeURL = [decoder decodeObjectForKey:kRDAlbumIconLargeURL];
    _name = [decoder decodeObjectForKey:kRDAlbumName];
    _playCount = [decoder decodeObjectForKey:kRDAlbumPlayCount];
    _price = [decoder decodeObjectForKey:kRDAlbumPrice];
    _profileURL = [decoder decodeObjectForKey:kRDAlbumProfileURL];
    _releaseDate = [decoder decodeObjectForKey:kRDAlbumReleaseDate];
    _sampleable = [decoder decodeBoolForKey:kRDAlbumSampleable];
    _shortURL = [decoder decodeObjectForKey:kRDAlbumShortURL];
    _streamable = [decoder decodeBoolForKey:kRDAlbumStreamable];
    _syncable = [decoder decodeBoolForKey:kRDAlbumSyncable];
    _trackCount = [decoder decodeObjectForKey:kRDAlbumTrackCount];
    _trackKeys = [decoder decodeObjectForKey:kRDAlbumTrackKeys];

    return self;
}

#pragma mark -
#pragma mark NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone
{
    RDAlbum *object = [super copyWithZone:zone];

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
    object->_compilation = NO;
    [object setCompilation:[self isCompilation]];
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
    object->_name = nil;
    [object setName:[self name]];
    object->_playCount = nil;
    [object setPlayCount:[self playCount]];
    object->_price = nil;
    [object setPrice:[self price]];
    object->_profileURL = nil;
    [object setProfileURL:[self profileURL]];
    object->_releaseDate = nil;
    [object setReleaseDate:[self releaseDate]];
    object->_sampleable = NO;
    [object setSampleable:[self isSampleable]];
    object->_shortURL = nil;
    [object setShortURL:[self shortURL]];
    object->_streamable = NO;
    [object setStreamable:[self isStreamable]];
    object->_syncable = NO;
    [object setSyncable:[self isSyncable]];
    object->_trackCount = nil;
    [object setTrackCount:[self trackCount]];
    object->_trackKeys = nil;
    [object setTrackKeys:[self trackKeys]];

    return object;
}

#pragma mark -
#pragma mark NSObject Protocol

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self key]];
}

@end
