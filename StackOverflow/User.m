//
//  User.m
//  
//
//  Created by Lindsey on 12/8/15.
//
//

#import "User.h"

@implementation User

-(id)initWithDisplayName: (NSString*)displayName reputation:(int)reputation userId:(int)userID userType:(NSString*)userType profileImageURL:(NSURL*)profileImageURL link:(NSURL*)link{

    
    if (self = [super init]){
        [self setDisplayName:displayName];
        [self setReputation:reputation];
        [self setUserId:userID];
        [self setUserType:userType];
        [self setProfileImageURL:profileImageURL];
        [self setLink:link];
    }
    return self;
}

@end
