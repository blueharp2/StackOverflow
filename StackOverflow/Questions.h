//
//  Questions.h
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//
//"is_answered": true,
//"view_count": 431,
//"answer_count": 2,
//"score": 1,
//"question_id": 30228819,
//"title": "&quot;No MBean found for MobileFirst project &#39;HelloWorld&#39;&quot;"


#import <Foundation/Foundation.h>
#import "User.h"

@interface Questions : NSObject

@property User *owner;
@property BOOL *isAnswered;
@property int *viewCount;
@property int *answerCount;
@property int *score;
@property int *questionID;
@property NSString *title;

-(id)initWithTitle: (NSString *)title owner:(User *)owner isAnswered:(BOOL)isAnswered viewCount:(int)viewCount answerCount:(int)answerCount score:(int)score questionID:(int)questionID;


@end
