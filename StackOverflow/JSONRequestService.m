//
//  JSONRequestService.m
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "JSONRequestService.h"
#import "AFNetworking.h"


@implementation JSONRequestService

+(void)getRequestWithURL:(NSString *_Nonnull) url parameters:(NSDictionary *_Nullable)paramters withCompletion:(kNSDataCompletionHandler)completion{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSOperationQueue *managerQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [managerQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                [managerQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager GET:url parameters:paramters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSData *data = (NSData *) responseObject;
        completion(data, nil);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        completion(nil, error);
        
    }];
}

@end
