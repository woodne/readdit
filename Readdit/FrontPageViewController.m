//
//  MasterViewController.m
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "FrontPageViewController.h"
#import "PostViewController.h"
#import "PostTableViewCell.h"
#import "RedditKit.h"
#import "ImageFetcher.h"

@interface FrontPageViewController ()
@property (nonatomic) NSMutableArray *posts;
@property (nonatomic) NSMutableArray *cellHeights;

@end

@implementation FrontPageViewController

@synthesize posts;
@synthesize cellHeights = _cellHeights;
@synthesize subreddit = _subreddit;

- (NSMutableArray *)getCellHeights
{
    if (!_cellHeights) {
        _cellHeights = [[NSMutableArray alloc] init];
    }
    return _cellHeights;
}

- (void) setSubreddit:(NSString *)subreddit
{
    if (subreddit == nil) {
        _subreddit = @"frontpage";
    } else {
        _subreddit = subreddit;
    }
}

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [self.navigationController setToolbarHidden:YES animated:YES];
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.detailViewController = (PostViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];

    [self.tableView setEditing:NO];
    
    if (![self.subreddit isEqualToString:@"frontpage"]) {
        self.navigationItem.title = _subreddit;
        [[RKClient sharedClient] linksInSubredditWithName:self.subreddit pagination:nil completion:^(NSArray *links, RKPagination *pagination, NSError *error) {
            posts = [NSMutableArray arrayWithArray: links];
            [self.tableView reloadData];
        }];
    } else {
        self.navigationItem.title = @"Front Page";
        [[RKClient sharedClient] frontPageLinksWithPagination:nil completion:^(NSArray *links, RKPagination *pagination, NSError *error) {
            posts = [NSMutableArray arrayWithArray:links];
            [self.tableView reloadData];
        }];
    }
    [ImageFetcher reset];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReadditPost" forIndexPath:indexPath];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ReadditPost" forIndexPath:indexPath];
    }
    
    [cell setPost:[posts objectAtIndex:indexPath.row]];
    [self.cellHeights insertObject:cell.height atIndex:indexPath.row];
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RKLink *link = [posts objectAtIndex:indexPath.row];
    CGRect rect = [PostTableViewCell getRectToFitTitle:link.title];
    
    return rect.size.height + 50;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }   
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        RKLink *object = [posts objectAtIndex:indexPath.row];
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        RKLink *object = [posts objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}


@end
