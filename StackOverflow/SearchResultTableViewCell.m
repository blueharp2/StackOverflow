//
//  SearchResultTableViewCell.m
//  StackOverflow
//
//  Created by Lindsey on 12/8/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "SearchResultTableViewCell.h"
#import "ImageFetchService.h"

@interface SearchResultTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end


@implementation SearchResultTableViewCell

-(void)setQuestion:(Questions *)question{
    self.titleLabel.text = question.title;
    
    [ImageFetchService fetchImageInBackgroundFromURL:question.owner.profileImageURL completionHandler:^(UIImage * _Nullable data, NSError * _Nullable error) {
        if (error) {
            [self.imageView setImage:@"hamburger"];
        }
        [self.imageView setImage:data];
    }];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
