//
//  DetailViewController.m
//  Readdit
//
//  Created by Nicholas Wood on 4/19/14.
//  Copyright (c) 2014 Nicholas Wood. All rights reserved.
//

#import "PostViewController.h"
#import "ImageFetcher.h"

@interface PostViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation PostViewController

@synthesize detailItem;

#pragma mark - Managing the detail item

- (void)setDetailItem:(RKLink *)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.navigationItem.title = detailItem.title;
        
        if (detailItem.isImageLink) {
            [ImageFetcher getImageFromURL:detailItem.URL thenPerform:^(UIImage *img) {
//                [self.postImage sizeThatFits:img.size];
                self.postImage.image = img;
                [self.imageSpinner stopAnimating];
            }];
        } else if (self.detailItem.isSelfPost){
            self.postImage.hidden = true;
            [self.imageSpinner stopAnimating];
            
            self.selfPostLabel.text = detailItem.selfText;
            [self.selfPostLabel sizeToFit];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
