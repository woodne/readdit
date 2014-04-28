//
//  BooleanOptionTableViewCell.m
//  Readdit
//
//  Created by Nicholas Wood on 4/27/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "BooleanOptionTableViewCell.h"

@implementation BooleanOptionTableViewCell

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

@end
