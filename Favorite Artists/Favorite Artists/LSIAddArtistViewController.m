//
//  LSIAddArtistViewController.m
//  Favorite Artists
//
//  Created by Enayatullah Naseri on 4/18/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import "LSIAddArtistViewController.h"
#import "NSArtist+LSINSJSONSerialization.h"
#import "LSIArtistController.h"
#import "LSIArtist.h"

@interface LSIAddArtistViewController () <UISearchBarDelegate>

@end

@implementation LSIAddArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self.searchBar setDelegate:self];
}

- (void)setupViews
{
    self.artistNameLabel.text = @"";
    self.yearFormedLabel.text = @"";
    self.biographyTextView.text = @"";
}


//MARK:- search function

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
//    [self.artistController searchForArtist:searchBar.text completion:^(LSIArtist *artist, NSError *error) {
//        if (error) {
//            NSLog(@"Error searching for artist: %@", error);
//            return;
//        }
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.searchArtist = artist;
//            self.artistNameLabel.text = self.searchArtist.name;
//            self.yearFormedLabel.text = [NSString stringWithFormat:@"Formed %d", self.searchArtist.yearFormed];
//            self.biographyTextView.text = self.searchArtist.biography;
//        });
//    }];
}

//MARK:- save action button

- (IBAction)saveButtonTapped:(id)sender {
    if (self.searchArtist) {
        [self saveArtist:_searchArtist];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        NSLog(@"Could not save artist");
    }
}


//MARK:- save

- (void)saveArtist:(LSIArtist *)artist {
    
    if (artist) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:[artist toDictionary] options:0 error:nil];
        NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
        NSURL *url = [[directory URLByAppendingPathComponent:self.searchArtist.name] URLByAppendingPathExtension:@"json"];
        
        [data writeToURL:url atomically:YES];
    } else {
        NSLog(@"Error saving new artist");
        return;
    }
    return;
}


@end
