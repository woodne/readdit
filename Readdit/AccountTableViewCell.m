//
//  AccountTableViewCell.m
//  Readdit
//
//  Created by Nicholas Wood on 4/27/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "AccountTableViewCell.h"

int usernameIndex;

@implementation AccountTableViewCell

@synthesize accountLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithIndex:(NSInteger)index
{
    self = [super init];
    [self setUsernameIndex:index];
    return self;
    
}


- (void) setUsernameIndex:(NSInteger)index
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *usernames = [defaults arrayForKey:@"usernames"];
    if (index >= usernames.count) {
        self.accountLabel.text = @"Add another account...";
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        usernameIndex = index;
        NSString *username = [[defaults arrayForKey:@"usernames"] objectAtIndex:index];
        if ([[defaults stringForKey:@"activeUser"] isEqualToString:username]) {
            self.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        self.accountLabel.text = username;
    }
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

@end
