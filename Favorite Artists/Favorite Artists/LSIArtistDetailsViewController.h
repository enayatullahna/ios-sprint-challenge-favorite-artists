//
//  LSIArtistDetailsViewController.h
//  Favorite Artists
//
//  Created by Enayatullah Naseri on 4/18/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSIArtistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtistDetailsViewController : UIViewController

//MARK:- Outlets
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearFormedLabel;
@property (weak, nonatomic) IBOutlet UITextView *biographyTextView;

//MARK:- Properties
@property LSIArtist *artist;

@end

NS_ASSUME_NONNULL_END
