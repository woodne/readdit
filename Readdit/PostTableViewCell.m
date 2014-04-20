//
//  PostTableViewCell.m
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setPost: (RKLink *) link
{
    self.postScore.text = [NSString stringWithFormat:@"%ld", (long)link.score];
    // If the user wants to show up and down votes set the labels
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"showUpDown"]) {
        self.upLabel.hidden = NO;
        self.downLabel.hidden = NO;
        self.upLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)link.upvotes];
        self.downLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)link.downvotes];
    } else {
        self.upLabel.hidden = YES;
        self.downLabel.hidden = YES;
    }
    
    self.title.text = link.title;
    self.authorLabel.text = [NSString stringWithFormat:@"/u/%@", link.author];
    
    if (link.isSelfPost) {
        self.typeLabel.text = [NSString stringWithFormat:@"self.%@", link.subreddit];
    }
    else if (link.isImageLink) {
        self.typeLabel.text = [NSString stringWithFormat:@"img:%@", link.domain];
    }
}
@end
