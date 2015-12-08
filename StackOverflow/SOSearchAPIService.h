//
//  SOSearchAPIService.h
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOSearchAPIService : NSObject

+(void)searchWithTerm:(NSString *)searchTerm pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler)completion;

@end
