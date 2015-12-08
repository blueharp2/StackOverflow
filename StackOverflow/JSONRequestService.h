//
//  JSONRequestService.h
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface JSONRequestService : NSObject

+(void)getRequestWithURL:(NSString *_Nonnull) url parameters:(NSDictionary *_Nullable)paramters withCompletion:(kNSDataCompletionHandler)completion;

@end
