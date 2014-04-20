//
//  SubredditTableViewCell.m
//  Readdit
//
//  Created by Nicholas Wood on 4/20/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "SubredditTableViewCell.h"

@implementation SubredditTableViewCell

@synthesize isFrontPage;
@synthesize subreddit = _subreddit;

- (void) setSubreddit:(NSString *)subreddit
{
    _subreddit = subreddit;
    if ([subreddit isEqualToString:@"frontpage"]) {
        self.subredditLabel.text = @"Front Page";
    } else {
        self.subredditLabel.text = [NSString stringWithFormat:@"/r/%@", _subreddit];
    }
    
    [self setNeedsDisplay];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id) initWithSubreddit:(NSString *)subreddit
{
    _subreddit = subreddit;
    return self;
}
@end
