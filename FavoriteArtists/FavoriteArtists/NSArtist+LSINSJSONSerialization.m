//
//  NSArtist+LSINSJSONSerialization.m
//  FavoriteArtists
//
//  Created by Enayatullah Naseri on 5/30/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import "NSArtist+LSINSJSONSerialization.h"
#import "LSIArtist.h"

@implementation LSIArtist (LSINSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary

{
    if (self = [super init]) {
        
        self.name = [dictionary objectForKey:@"stringArtist"];
        self.biography = [dictionary objectForKey:@"stringBiography"];
        self.yearFormed = [[dictionary objectForKey:@"intFormedYear"] intValue];
        
    }
    
    return self;
}

- (NSDictionary *)toDictionary

{
    NSMutableDictionary *artistDictionary = [NSMutableDictionary dictionary];
    [artistDictionary setObject:self.name forKey:@"stringArtist"];
    [artistDictionary setObject:self.biography forKey:@"stringBiography"];
    

    NSString *yearFormedString = @(self.yearFormed).stringValue;
    [artistDictionary setObject:yearFormedString forKey:@"intFormedYear"];

    NSDictionary *finalArtistDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.name, @"stringArtist", self.biography, @"stringBiography", yearFormedString, @"intFormedYear", nil];

    return finalArtistDictionary;
}

@end
