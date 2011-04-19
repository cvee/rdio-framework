//
//  RDObject.m
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

#import "RDObject.h"
#import <Foundation/NSCoder.h>
#import <Foundation/NSDictionary.h>
#import <Foundation/NSString.h>


#pragma mark -
#pragma mark Constants

NSString *kRDObjectKey = @"key";
NSString *kRDObjectType = @"type";

#pragma mark -

@implementation RDObject

#pragma mark -
#pragma mark Properties

@synthesize key;
@synthesize type;

#pragma mark -
#pragma mark Initialization

- (id)initWithDictionary:(NSDictionary *)aDictionary
{
    if (!(self = [super init])) { return nil; }

    id aKey = [aDictionary objectForKey:@"key"];
    if ([aKey isKindOfClass:[NSString class]])
    {
        key = [(NSString *)aKey copy];
    }

    id aType = [aDictionary objectForKey:@"type"];
    if ([aType isKindOfClass:[NSString class]])
    {
        type = [(NSString *)aType copy];
    }

    return self;
}

#pragma mark -
#pragma mark Deallocation

- (void)dealloc
{
    [key release];
    key = nil;
    [type release];
    type = nil;

    [super dealloc];
}

#pragma mark -
#pragma mark NSCoding Protocol

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:key forKey:kRDObjectKey];
    [encoder encodeObject:type forKey:kRDObjectType];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (!(self = [self init])) { return nil; }

    key = [decoder decodeObjectForKey:kRDObjectKey];
    type = [decoder decodeObjectForKey:kRDObjectType];

    return self;
}

#pragma mark -
#pragma mark NSCopying Protocol

- (id)copyWithZone:(NSZone *)zone
{
    RDObject *object = [[[self class] allocWithZone:zone] init];

    object->key = nil;
    [object setKey:[self key]];
    object->type = nil;
    [object setType:[self type]];

    return object;
}

#pragma mark -
#pragma mark NSObject Protocol

- (NSString *)description
{
    return [self key];
}

@end
