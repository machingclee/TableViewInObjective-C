//
//  HTTPService.m
//  DevslopesTutorial
//
//  Created by Ching-Cheong Lee on 1/11/2020.
//

#import "HTTPService.h"
#define URL_BASE "http://localhost:8080"
#define URL_TUTORIALS "/tutorials"


@implementation HTTPService
+(id) instance {

//  The static keyword will enforce its line to be executed ONLY once for the entire application runtime--regardless of the number of invocations
//  Put in other way, the function “remembers” its value across invocations.
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}

- (void) getTutorials : (nullable onComplete) completionHandler{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(data != nil){
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if(err == nil){
                completionHandler(json, nil);
                
            } else {
                completionHandler(nil, @"Data is corrupt, please try again.");
            }
        } else {
            NSLog(@"Error: %@", error.debugDescription);
            completionHandler(nil, @"problem connecting to the server");
        }
        
    }] resume];
}

@end
