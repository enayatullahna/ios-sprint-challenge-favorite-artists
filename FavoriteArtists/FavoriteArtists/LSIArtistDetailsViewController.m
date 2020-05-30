//
//  LSIArtistDetailsViewController.m
//  FavoriteArtists
//
//  Created by Enayatullah Naseri on 5/30/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import "LSIArtistDetailsViewController.h"
#import "LSIArtist.h"

@interface LSIArtistDetailsViewController ()

@end

@implementation LSIArtistDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews {
    
    [self.navigationItem setTitle:self.artist.name];
    
    self.artistNameLabel.text = self.artist.name;
    
    NSString *yearFormed = [NSString stringWithFormat:@"Formed Year: %d", self.artist.yearFormed];
    self.yearFormedLabel.text = yearFormed;
    
    self.biographyTextView.text = self.artist.biography;
}

@end
