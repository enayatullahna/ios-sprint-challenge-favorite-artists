//
//  NSArtist+LSINSJSONSerialization.h
//  Favorite Artists
//
//  Created by Enayatullah Naseri on 4/18/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist (LSINSJSONSerialization)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
