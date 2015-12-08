//
//  Error.h
//  StackOverflow
//
//  Created by Lindsey on 12/7/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kStackOverFlowErrorDomain;

typedef enum : NSUInteger{
    StackOverFlowBadJSON,
    StackOverFlowConnectionDown,
    StackOverFlowGeneralError,
} StackOverFlowErrorCodes;

@interface Error : NSError

@end
