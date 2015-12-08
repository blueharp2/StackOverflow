//
//  MenuTableViewController.m
//  StackOverflow
//
//  Created by Lindsey on 12/7/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "MenuTableViewController.h"
#import "Error.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *stackOverflowError = [NSError errorWithDomain:kStackOverFlowErrorDomain code:StackOverFlowBadJSON userInfo:nil];
    NSError *stackOverflowErrorTwo = [NSError errorWithDomain:kStackOverFlowErrorDomain code:StackOverFlowConnectionDown userInfo:nil];
    NSError *stackOverflowErrorThree = [NSError errorWithDomain:kStackOverFlowErrorDomain code:StackOverFlowGeneralError userInfo:nil];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
