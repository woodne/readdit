//
//  PostTableViewCell.m
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "PostTableViewCell.h"
#import "Resources.h"

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
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"ShowUpDownVotes"]) {
        self.upLabel.hidden = NO;
        self.downLabel.hidden = NO;
        self.upLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)link.upvotes];
        self.downLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)link.downvotes];
    } else {
        self.upLabel.hidden = YES;
        self.downLabel.hidden = YES;
    }
    

    CGRect labelRect = [PostTableViewCell getRectToFitTitle:link.title];
    labelRect.origin = self.title.frame.origin;
    self.title.frame = labelRect;
    self.title.text = link.title;
    
    self.authorLabel.text = [NSString stringWithFormat:@"/u/%@", link.author];
    
    if (link.isSelfPost) {
        self.typeLabel.text = [NSString stringWithFormat:@"self.%@", link.subreddit];
    }
    else if (link.isImageLink) {
        self.typeLabel.text = [NSString stringWithFormat:@"img:%@", link.domain];
    }
    
    self.height = [NSNumber numberWithFloat:10 + labelRect.size.height + self.authorLabel.frame.size.height];
}

+ (CGRect) getRectToFitTitle: (NSString *) title
{
    NSAttributedString *titleAttrStr = [[NSAttributedString alloc] initWithString:title attributes:[Resources getFontAttributes]];
    
    CGSize labelConstraints = CGSizeMake(200, MAXFLOAT);
    CGRect labelRect = [titleAttrStr boundingRectWithSize:labelConstraints
                                           options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                           context:nil];
    
    return labelRect;
}
@end
