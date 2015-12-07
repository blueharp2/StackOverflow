//
//  MenuContainerViewController.m
//  StackOverflow
//
//  Created by Lindsey on 12/7/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "MenuContainerViewController.h"
#import "MenuTableViewController.h"
#import "MainContentViewController.h"
#import "MyQuestionsViewController.h"

CGFloat const kburgerOpenScreenDivider = 3.0;
CGFloat const kburgerOpenScreenMultiplier = 2.0;
CGFloat const kburgerButtonWidth = 50.0;
CGFloat const kburgerButtonHeight = 50.0;

NSTimeInterval const kburgerTimeToSlideMenuOpen = 0.2;



@interface MenuContainerViewController () <UITableViewDelegate>

@property (strong, nonatomic) MenuTableViewController *leftMenuViewController;
@property (strong, nonatomic) MainContentViewController *topViewController;
@property (strong, nonatomic) MyQuestionsViewController *myQuestionsViewController;

@property (strong, nonatomic) UIButton *burgerButton;
@property (strong, nonatomic) UIPanGestureRecognizer *panGesture;

@property (strong, nonatomic) NSArray *viewControllers;

@end

@implementation MenuContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
