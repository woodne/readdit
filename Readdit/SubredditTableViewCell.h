//
//  SubredditTableViewCell.h
//  Readdit
//
//  Created by Nicholas Wood on 4/20/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubredditTableViewCell : UITableViewCell

@property (nonatomic) NSString *subreddit;
@property (nonatomic) BOOL isFrontPage;

@property (nonatomic, strong) IBOutlet UILabel *subredditLabel;

- (id) initWithSubreddit: (NSString *)subreddit;

@end
