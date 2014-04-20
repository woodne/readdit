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
    self.postScore.text = [NSString stringWithFormat:@"%d", [link score]];
    self.title.text = [link title];
    
    if (link.isSelfPost) {
        self.typeLabel.text = [NSString stringWithFormat:@"self.%@", link.subreddit];
    }
    else if (link.isImageLink) {
        self.typeLabel.text = [NSString stringWithFormat:@"img:%@", link.domain];
    }
}
@end
