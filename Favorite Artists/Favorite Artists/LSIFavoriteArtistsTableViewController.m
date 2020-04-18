//
//  LSIFavoriteArtistsTableViewController.m
//  Favorite Artists
//
//  Created by Enayatullah Naseri on 4/18/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import "LSIFavoriteArtistsTableViewController.h"
#import "LSIArtistController.h"
#import "LSIArtistDetailsViewController.h"
#import "LSIAddArtistViewController.h"


@interface LSIFavoriteArtistsTableViewController ()

//MARK:- Properties
@property LSIArtistController *artistController;
@property NSMutableArray *artistArray;
@property LSIArtist *artist;

@end

//MARK:- Implementation
@implementation LSIFavoriteArtistsTableViewController

//MARK:- View Will Appear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.artistController) {
        self.artistController = [[LSIArtistController alloc] init];
        self.artist = [[LSIArtist alloc] init];
    }
    
    [self.artistArray removeAllObjects];
    self.artistArray = [self.artistController fetchAllSavedArtists];
    
    NSLog(@"%lu", (unsigned long)self.artistArray.count);
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteArtistCell" forIndexPath:indexPath];
    
    LSIArtist *artist = self.artistArray[indexPath.row];
    cell.textLabel.text = artist.name;
    
    NSString *yearFrm = [NSString stringWithFormat:@"Formed in year: %d", artist.yearFormed];
    cell.detailTextLabel.text = yearFrm;
    
    return cell;
}



#pragma mark - Navigation Segue

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"AddArtist"]) {
        LSIAddArtistViewController *destinationVC = segue.destinationViewController;
        destinationVC.artistController = self.artistController;
    } else if ([segue.identifier isEqualToString:@"ShowArtistDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LSIArtistDetailsViewController *destinationVC = segue.destinationViewController;
        self.artist = [self.artistArray objectAtIndex:indexPath.row];
        destinationVC.artist = self.artist;
    }
    
}


@end
