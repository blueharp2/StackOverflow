//
//  OAuthWebViewController.h
//  StackOverflow
//
//  Created by Lindsey on 12/7/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OAuthWebViewControllerCompletion)();

@interface OAuthWebViewController : UIViewController

@property (copy, nonatomic) OAuthWebViewControllerCompletion completion;

@end
