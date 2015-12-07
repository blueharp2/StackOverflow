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
    [self setupBurgerButton];
    [self setupPanGesture];
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

-(void) setupBurgerButton {
    UIButton *burgerButton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, kburgerButtonWidth, kburgerButtonHeight)];
    [burgerButton setImage:[UIImage imageNamed:@"hamburger"] forState:UIControlStateNormal];
    [self.topViewController.view addSubview:burgerButton];
    [burgerButton addTarget:self action:@selector(burgerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.burgerButton = burgerButton;
}

-(void) burgerButtonPressed: (UIButton *)sender {
    [UIView animateWithDuration:kburgerTimeToSlideMenuOpen animations:^{
        self.topViewController.view.center = CGPointMake(self.view.center.x *kburgerOpenScreenMultiplier, self.topViewController.view.center.y);
    } completion:^(BOOL finished) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToCloseMenu:)];
        [self.topViewController.view addGestureRecognizer:tap];
        sender.userInteractionEnabled = false;

    }];
}

-(void) tapToCloseMenu:(UITapGestureRecognizer *)tap{
    [self.topViewController.view removeGestureRecognizer:tap];
    [UIView animateWithDuration:kburgerTimeToSlideMenuOpen animations:^{
        self.topViewController.view.center = self.view.center;
    }completion:^(BOOL finished) {
        self.burgerButton.userInteractionEnabled = YES;
    
    }];
}

-(void) setupPanGesture{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(topViewControllerPanned:)];
    [self.topViewController.view addGestureRecognizer:pan];
    self.panGesture = pan;
}

-(void) topViewControllerPanned:(UIPanGestureRecognizer *) sender{
    CGPoint velocity = [sender velocityInView:self.topViewController.view];
    CGPoint translation = [sender translationInView:self.topViewController.view];
    
    if (sender.state == UIGestureRecognizerStateChanged){
        if (velocity.x > 0){
            CGPointMake(self.topViewController.view.center.x + translation.x, self.topViewController.view.center.y);
            [sender setTranslation:CGPointZero inView:self.topViewController];
        }
    }
    if (sender.state == UIGestureRecognizerStateEnded){
        if (self.topViewController.view.frame.origin.x > self.topViewController.view.frame.size.width /kburgerOpenScreenDivider){
            [UIView animateWithDuration:kburgerTimeToSlideMenuOpen animations:^{
                self.topViewController.view.center = CGPointMake(self.view.center.x * kburgerOpenScreenMultiplier, self.topViewController.view.center.y);
            } completion:^(BOOL finished) {
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToCloseMenu:)];
                [self.topViewController.view addGestureRecognizer:tap];
                self.burgerButton.userInteractionEnabled = NO;
            }];
        }else {
            [UIView animateWithDuration:kburgerTimeToSlideMenuOpen animations:^{
                self.topViewController.view.center = CGPointMake(self.view.center.x, self.topViewController.view.center.y);
            }completion:^(BOOL finished) {
                
            }];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
