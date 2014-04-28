//
//  OptionsViewController.m
//  Readdit
//
//  Created by Nicholas Wood on 4/20/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "OptionsViewController.h"
#import "AccountTableViewCell.h"

#import "PDKeychainBindingsController.h"

@interface OptionsViewController ()

@property (strong) NSDictionary *settings;

@end

@implementation OptionsViewController

@synthesize settings;

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
    
    settings = @{@"ShowUpDownVotes": @"bool",
                       @"FontSize" : @"numeric",
                      @"ShowFlair" : @"bool"
                };
}


- (IBAction) upDownSwitchPressed:(id) sender
{
    BOOL showUpDown = ((UISwitch *) sender).isOn;
    
    [[NSUserDefaults standardUserDefaults] setBool:showUpDown forKey:@"ShowUpDownVotes"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = @"";
    if (section == 0) {
        title = @"accounts";
    } else if (section == 1) {
        title = @"settings";
    }
    return title;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"AccountCell"];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"OptionsCell"];
    }
    
    if (!cell) {
        if (indexPath.section == 0) {
            cell = [[AccountTableViewCell alloc] init];
        } else {
            cell = [[UITableViewCell alloc] init];
        }
    }
    
    if (indexPath.section == 0) {
        [(AccountTableViewCell *)cell setUsernameIndex:indexPath.row];
    }
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[[NSUserDefaults standardUserDefaults] arrayForKey:@"usernames"] count] + 1;
    } else if (section == 1){
        return self.settings.allKeys.count;
    }
    return 0;
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
