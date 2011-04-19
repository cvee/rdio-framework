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
NSString *kRDArtistTrackCount = @"trackCount";

#pragma mark -

@implementation RDArtist

#pragma mark -
#pragma mark Properties

@synthesize albumCount;
@synthesize baseIcon;
@synthesize iconURL;
@synthesize name;
@synthesize profileURL;
@synthesize trackCount;

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
        albumCount = [(NSNumber *)aAlbumCount retain];
    }
    else if ([aAlbumCount isKindOfClass:[NSString class]])
    {
        albumCount = [[numberFormatter numberFromString:(NSString *)aAlbumCount] retain];
    }

    id aBaseIcon = [aDictionary objectForKey:@"baseIcon"];
    if ([aBaseIcon isKindOfClass:[NSString class]])
    {
        baseIcon = [(NSString *)aBaseIcon copy];
    }

    id aIconURL = [aDictionary objectForKey:@"icon"];
    if ([aIconURL isKindOfClass:[NSString class]])
    {
        iconURL = [[NSURL alloc] initWithString:(NSString *)aIconURL];
    }
    if ([aIconURL isKindOfClass:[NSURL class]])
    {
        iconURL = [(NSURL *)aIconURL retain];
    }

    id aName = [aDictionary objectForKey:@"name"];
    if ([aName isKindOfClass:[NSString class]])
    {
        name = [(NSString *)aName copy];
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

    id aTrackCount = [aDictionary objectForKey:@"length"];
    if ([aTrackCount isKindOfClass:[NSNumber class]])
    {
        trackCount = [(NSNumber *)aTrackCount retain];
    }
    else if ([aTrackCount isKindOfClass:[NSString class]])
    {
        trackCount = [[numberFormatter numberFromString:(NSString *)aTrackCount] retain];
    }

    [numberFormatter release];

    return self;
}

#pragma mark -
#pragma mark Deallocation

- (void)dealloc
{
    [albumCount release];
    albumCount = nil;
    [baseIcon release];
    baseIcon = nil;
    [iconURL release];
    iconURL = nil;
    [name release];
    name = nil;
    [profileURL release];
    profileURL = nil;
    [trackCount release];
    trackCount = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark Protocol (NSCoding)

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];

    [encoder encodeObject:albumCount forKey:kRDArtistAlbumCount];
    [encoder encodeObject:baseIcon forKey:kRDArtistBaseIcon];
    [encoder encodeObject:iconURL forKey:kRDArtistIconURL];
    [encoder encodeObject:name forKey:kRDArtistName];
    [encoder encodeObject:profileURL forKey:kRDArtistProfileURL];
    [encoder encodeObject:trackCount forKey:kRDArtistTrackCount];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (!(self = [self initWithCoder:decoder])) return nil;

    albumCount = [decoder decodeObjectForKey:kRDArtistAlbumCount];
    baseIcon = [decoder decodeObjectForKey:kRDArtistBaseIcon];
    iconURL = [decoder decodeObjectForKey:kRDArtistIconURL];
    name = [decoder decodeObjectForKey:kRDArtistName];
    profileURL = [decoder decodeObjectForKey:kRDArtistIconURL];
    trackCount = [decoder decodeObjectForKey:kRDArtistTrackCount];

    return self;
}

#pragma mark -
#pragma mark Protocol (NSCopying)

- (id)copyWithZone:(NSZone *)zone
{
    RDArtist *object = [super copyWithZone:zone];

    object->albumCount = nil;
    [object setAlbumCount:[self albumCount]];
    object->baseIcon = nil;
    [object setBaseIcon:[self baseIcon]];
    object->iconURL = nil;
    [object setIconURL:[self iconURL]];
    object->name = nil;
    [object setName:[self name]];
    object->profileURL = nil;
    [object setProfileURL:[self profileURL]];
    object->trackCount = nil;
    [object setTrackCount:[self trackCount]];

    return object;
}

#pragma mark -
#pragma mark Protocol (NSObject)

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", [self name]];
}

@end
