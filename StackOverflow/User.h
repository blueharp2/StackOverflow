//
//  User.h
//  
//
//  Created by Lindsey on 12/8/15.
//
//

//"owner": {
//    "reputation": 16,
//    "user_id": 4869378,
//    "user_type": "registered",
//    "profile_image": "https://www.gravatar.com/avatar/08faf0bdccd4ab2c29db380da4275860?s=128&d=identicon&r=PG&f=1",
//    "display_name": "kaushik",
//    "link": "http://stackoverflow.com/users/4869378/kaushik"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface User : NSObject

@property int *reputation;
@property int *userId;
@property NSString *userType;
@property NSURL *profileImageURL;
@property UIImage *profileImage;
@property NSString *displayName;
@property NSURL *link;


-(id)initWithDisplayName: (NSString*)displayName reputation:(int)reputation userId:(int)userID userType:(NSString*)userType profileImageURL:(NSURL*)profileImageURL profileImage:(UIImage*)profileImage link:(NSURL*)link;


@end
