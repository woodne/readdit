//
//  PostTableViewCell.h
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RedditKit.h"

@interface PostTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *postScore;
@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *typeLabel;
@property (nonatomic, strong) IBOutlet UILabel *upLabel;
@property (nonatomic, strong) IBOutlet UILabel *downLabel;
@property (nonatomic, strong) IBOutlet UILabel *authorLabel;

@property (nonatomic) NSNumber *height;

- (void) setPost: (RKLink *) link;

+ (CGRect) getRectToFitTitle: (NSString *)title;

@end
