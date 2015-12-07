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
    [self setupAllViewControllers];
}

-(void) setupAllViewControllers{
    [self setupMenuViewController];
    [self setupMainContentViewController];
    
}

-(void) setupMenuViewController{
    MenuTableViewController *leftMenuVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuVC"];
    leftMenuVC.tableView.delegate = self;
    
    [self addChildViewController:leftMenuVC];
    leftMenuVC.view.frame = self.view.frame;
    
    [self.view addSubview:leftMenuVC.view];
    [leftMenuVC didMoveToParentViewController:self];
    self.leftMenuViewController = leftMenuVC;
}
-(void) setupMainContentViewController{
    MainContentViewController *contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainContentVC"];
    
    [self addChildViewController:contentViewController];
    contentViewController.view.frame = self.view.frame;
    
    [self.view addSubview:contentViewController];
    [contentViewController didMoveToParentViewController:self];
    self.topViewController =contentViewController;
}

-(void) setupAdditionalViewControllers{
    MyQuestionsViewController *myQuestionsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyQuestions VC"];
    self.myQuestionsViewController = myQuestionsVC;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
