//
//  DetailViewController.h
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedditKit.h"

@interface PostViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) RKLink *detailItem;

@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *imageSpinner;

@property (strong, nonatomic) IBOutlet UILabel *selfPostLabel;

@end
