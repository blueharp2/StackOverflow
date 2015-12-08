//
//  Questions.m
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.


//

#import "Questions.h"

@implementation Questions

-(id)initWithTitle: (NSString *)title owner:(User *)owner isAnswered:(BOOL)isAnswered viewCount:(int)viewCount answerCount:(int)answerCount score:(int)score questionID:(int)questionID {
    
    if (self = [super init]){
        [self setTitle:title];
        [self setOwner:owner];
        [self setIsAnswered:isAnswered];
        [self setViewCount:viewCount];
        [self setAnswerCount:answerCount];
        [self setScore:score];
        [self setQuestionID:questionID];
    }
    return self;
}

@end
