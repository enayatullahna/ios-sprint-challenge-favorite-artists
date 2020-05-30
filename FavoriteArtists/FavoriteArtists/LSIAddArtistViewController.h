//
//  LSIAddArtistViewController.h
//  FavoriteArtists
//
//  Created by Enayatullah Naseri on 5/30/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIAddArtistViewController : UIViewController

//MARK:- Outlets
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

//MARK:- Properties
@property LSIArtistController *artistController;
@property LSIArtist *searchArtist;

@end

NS_ASSUME_NONNULL_END
