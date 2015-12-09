//
//  SOSearchJSONParser.m
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "SOSearchJSONParser.h"
#import "User.h"
#import "Questions.h"

@implementation SOSearchJSONParser

+(void)questionsArrayFromDictionary:(NSDictionary *)dictionary completionHandler:(kNSArrayCompletionHandler)completion{
    
    NSMutableArray *result = [[NSMutableArray<Questions *> alloc]init];
    
    if (dictionary) {
        NSMutableArray *items = dictionary[@"items"];
        if (items) {
            for (NSDictionary *item in items) {
                User *owner;
                if (item) {
                    NSDictionary *ownerDictionary = item[@"owner"];
                    if (ownerDictionary) {
                        int reputation = (int) ownerDictionary[@"reputation"];
                        int userID = (int) ownerDictionary[@"user_id"];
                        NSString *userType = ownerDictionary[@"user_type"];
                        NSString *profileImageURLString = ownerDictionary[@"profile_image"];
                        NSString *displayName = ownerDictionary[@"display_name"];
                        NSString *linkURLString = ownerDictionary[@"link"];
                  
                        NSURL *profileImageURL = [[NSURL alloc]initWithString:profileImageURLString];
                        NSURL *link = [[NSURL alloc]initWithString:linkURLString];
                        
                        owner = [[User alloc]initWithDisplayName:displayName reputation:reputation userId:userID userType:userType profileImageURL:profileImageURL link:link];
                        
                    }
                    
                    BOOL isAnswered = (BOOL) item [@"is_answered"];
                    int viewCount = (int) item[@"view_count"];
                    int answerCount = (int) item[@"answer_count"];
                    int score = (int) item[@"score"];
                    int questionID = (int) item[@"question_id"];
                    NSString *title = item[@"title"];
                    
                    Questions *question = [[Questions alloc]initWithTitle:title owner:owner isAnswered:isAnswered viewCount:viewCount answerCount:answerCount score:score questionID:questionID];
                    
                    if (question != nil) {
                        [result addObject:question];
                    }
                }
            }
            if (result != nil) {
                completion(result, nil);
                return;
            }
        }
    }
    
    NSError *error = [NSError errorWithDomain:@"Error: Failed to complete request to StackOverflow Search" code:1 userInfo:nil];
    
    completion(nil,error);
    
}


@end
