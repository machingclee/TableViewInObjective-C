//
//  Video.h
//  DevslopesTutorial
//
//  Created by Ching-Cheong Lee on 2/11/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject

@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic,strong) NSString *videoDescription;
@property (nonatomic, strong) NSString *videoIframe;
@property (nonatomic, strong) NSString *thumbnail;

@end

NS_ASSUME_NONNULL_END
