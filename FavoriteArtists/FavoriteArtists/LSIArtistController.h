//
//  LSIArtistController.h
//  FavoriteArtists
//
//  Created by Enayatullah Naseri on 5/30/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSIArtist.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^LSIArtistSearchCompleted)(LSIArtist *artist, NSError *error);

@interface LSIArtistController : NSObject

- (void)searchForArtist:(NSString *)name completed:(LSIArtistSearchCompleted)completed;
- (void)saveArtist:(LSIArtist *)artist;
- (LSIArtist *)fetchSavedArtist:(LSIArtist *)artist;
- (NSMutableArray *)fetchAllSavedArtists;

@end

NS_ASSUME_NONNULL_END
