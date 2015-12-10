//
//  ImageFetchService.m
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "ImageFetchService.h"


@implementation ImageFetchService

+(void) lulTest123 {
}


+(void) fetchImagesWithDispatchQueue:(dispatch_queue_t)imgQueue withUrl:(NSURL * )url completionHandler:(kNSImageCompletionHandler)completionHandler {
    
    dispatch_async(imgQueue, ^{
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        
        UIImage *results = [[UIImage alloc]initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error == nil && data !=nil) {
                completionHandler(results, nil);
                return;
            }
            if (error == nil && data ==nil) {
                NSError *error = [NSError errorWithDomain:@"Error: Image is nil" code:1 userInfo:nil];
                completionHandler(nil, error);
                return;
            }
            completionHandler(nil, error);
        });
    });
}

+(void)fetchImageInBackgroundFromURL:(NSURL *_Nonnull)url completionHandler:(kNSImageCompletionHandler)completionHandler{
    
    dispatch_queue_t imageQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//    dispatch_queue_t imageQueue = dispatch_queue_create(NULL, DISPATCH_QUEUE_SERIAL);

//    DISPATCH_QUEUE_t imageQue = dispatch_queue_create();
    
    dispatch_async(imageQueue, ^{
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
        
        UIImage *results = [[UIImage alloc]initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error == nil && data !=nil) {
                completionHandler(results, nil);
                return;
            }
            if (error == nil && data ==nil) {
                NSError *error = [NSError errorWithDomain:@"Error: Image is nil" code:1 userInfo:nil];
                completionHandler(nil, error);
                return;
            }
            completionHandler(nil, error);
        });
    });
}

@end
