//
//  HTTPService.h
//  DevslopesTutorial
//
//  Created by Ching-Cheong Lee on 1/11/2020.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete) (NSArray * __nullable dataArray, NSError * __nullable errMessage);

NS_ASSUME_NONNULL_BEGIN

@interface HTTPService : NSObject

+ (id) instance;
- (void) getTutorials: (nullable onComplete) completionHandler;

@end


NS_ASSUME_NONNULL_END
