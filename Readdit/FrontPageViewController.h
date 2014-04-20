//
//  MasterViewController.h
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PostViewController;

#import <CoreData/CoreData.h>

@interface FrontPageViewController : UITableViewController

@property (strong, nonatomic) PostViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic) NSString *subreddit;

@end
