//
//  RootTableViewController.m
//  Readdit
//
//  Created by Nicholas Wood on 4/20/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "RootTableViewController.h"
#import "FrontPageViewController.h"
#import "SubredditTableViewCell.h"
#import "RedditKit.h"

@interface RootTableViewController ()

@property (nonatomic) NSArray *subreddits;

@end

@implementation RootTableViewController

@synthesize subreddits;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *stdDefaults = [NSUserDefaults standardUserDefaults];
    subreddits = [stdDefaults objectForKey:@"SubscribedSubreddits"];
    
    if (!subreddits) {
        subreddits = @[@"pics", @"aww", @"corgi"];
        [stdDefaults setObject:subreddits forKey:@"SubscribedSubreddits"];
        [stdDefaults synchronize];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return [subreddits count];
    } else {
        return 0;
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = @"";
    if (section == 1) {
        title = @"Subscribed Subreddits";
    }
    return title;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubredditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootCell"];
    if (!cell) {
        cell = [[SubredditTableViewCell alloc] init];
    }
    
    if (indexPath.section == 0) {
        cell.subreddit = @"frontpage";
    }
    else if (indexPath.section == 1) { // section displaying subreddits.
        cell.subreddit = [subreddits objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FrontPageViewController *front = [segue destinationViewController];
    SubredditTableViewCell *subRedditCell = (SubredditTableViewCell *)sender;
    front.subreddit = subRedditCell.subreddit;
}

@end
