//
//  VideoCell.h
//  DevslopesTutorial
//
//  Created by Ching-Cheong Lee on 2/11/2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class Video;

@interface VideoCell : UITableViewCell
-(void) updateUI:(nonnull Video *) video;
@end

NS_ASSUME_NONNULL_END
