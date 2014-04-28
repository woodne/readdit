//
//  AccountTableViewCell.h
//  Readdit
//
//  Created by Nicholas Wood on 4/27/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *accountLabel;

- (id) initWithIndex:(NSInteger)index;
- (void) setUsernameIndex:(NSInteger)index;
@end
