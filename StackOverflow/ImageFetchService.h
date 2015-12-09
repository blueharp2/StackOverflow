//
//  ImageFetchService.h
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import <UIKit/UIKit.h>

@interface ImageFetchService : NSObject

+(void)fetchImageInBackgroundFromURL:(NSURL *_Nonnull)url completionHandler:(kNSImageCompletionHandler)completionHandler;

@end
