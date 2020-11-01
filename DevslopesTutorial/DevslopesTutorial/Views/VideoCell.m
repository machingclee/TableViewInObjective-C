//
//  VideoCell.m
//  DevslopesTutorial
//
//  Created by Ching-Cheong Lee on 2/11/2020.
//

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImg;
@property (weak, nonatomic) IBOutlet UIStackView *cellContainerView;
@end

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor
                              colorWithRed: 157.0/255.0
                              green:        157.0/255.0
                              blue:         157.0/255.0
                              alpha:        0.8
                              ].CGColor;

    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
}

-(void) updateUI:(nonnull Video *) video{
    self.titleLabel.text = video.videoTitle;
    self.desLabel.text = video.videoDescription;
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnail]]];
    NSLog(@"the image: %@", video.thumbnail);
    self.thumbImg.image = image;
}

@end
