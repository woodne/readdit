//
//  OptionsViewController.m
//  Readdit
//
//  Created by Nicholas Wood on 4/20/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.showUpDownVotes setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"ShowUpDownVotes"]];
}


- (IBAction) upDownSwitchPressed:(id) sender
{
    [[NSUserDefaults standardUserDefaults] setBool:((UISwitch *)sender).isOn forKey:@"ShowUpDownVotes"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
