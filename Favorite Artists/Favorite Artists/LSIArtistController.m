//
//  LSIArtistController.m
//  Favorite Artists
//
//  Created by Enayatullah Naseri on 4/18/20.
//  Copyright © 2020 Enayatullah Naseri. All rights reserved.
//

#import "LSIArtistController.h"
#import "LSIArtist.h"
#import "NSArtist+LSINSJSONSerialization.h"

//MARK:- Base url
static NSString *baseURL = @"https://www.theaudiodb.com/api/v1/json/1/search.php?s=macklemore";

//MARK:- interface
@interface LSIArtistController ()

@property NSMutableArray *internalArtistArray;

@end

//MARK:- Implementation
@implementation LSIArtistController

- (instancetype)init
{
    if (self = [super init]) {
        _internalArtistArray = [[NSMutableArray alloc] init];
    }
    return self;
}


//MARK:- search
- (void)searchForArtist:(NSString *)name completed:(LSIArtistSearchCompleted)completed

{
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:baseURL];
    NSArray *queryItems = @[[NSURLQueryItem queryItemWithName:@"s" value:name]];
    components.queryItems = queryItems;
    NSURL *url = components.URL;

    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error receiving artist: %@", error);
            completed(nil, error);
            return;
        }

        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@" Error json parsing: %@", jsonError);
            completed(nil, error);
            return;
        }

        NSArray *dictionary = json[@"artists"];
        LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:dictionary[0]];
        completed(artist, nil);
        
    }];

    [task resume];
}

//MARK:- save
- (void)saveArtist:(LSIArtist *)artist
{
    [self.internalArtistArray addObject:artist];
}

- (LSIArtist *)fetchSavedArtist:(LSIArtist *)artist
{
    NSURL *directory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *url = [[directory URLByAppendingPathComponent:artist.name] URLByAppendingPathExtension:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];

    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    LSIArtist *savedArtist = [[LSIArtist alloc] initWithDictionary:dictionary];
    return savedArtist;
}

//MARK:- fetch
- (NSMutableArray *)fetchAllSavedArtists
{
    NSArray *searchPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directory = [searchPath objectAtIndex:0];
    NSArray *filePaths = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:directory error:nil];

    for (NSString *artist in filePaths) {
        NSString *filePath = [[NSString alloc]initWithFormat:@"Documents/%@", artist];
        NSString *artistPath = [NSHomeDirectory() stringByAppendingPathComponent:filePath];

        NSURL *artistURL = [NSURL fileURLWithPath:artistPath];
        NSData *artistData = [[NSData alloc] initWithContentsOfURL:artistURL];

        if (artistData != nil) {
            NSDictionary *artistDictionary = [NSJSONSerialization JSONObjectWithData:artistData options:0 error:nil];
            LSIArtist *artist = [[LSIArtist alloc] initWithDictionary:artistDictionary];
            [self.internalArtistArray addObject:artist];
        } else {
            NSLog(@"Data returned nil for artist");
        }
    }
    return self.internalArtistArray;
}

@end
