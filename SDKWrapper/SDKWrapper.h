//
//  SDKWrapper.h
//  SDKWrapper
//
//  Created by Brian Donohue on 7/23/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SDKWrapper : NSObject

- (id)initWithSDK:(Class)sdk;

- (void)initialize:(void(^)(void))initialize;
- (void)delayedInitialize:(void(^)(void))initialize;
- (void)safeSDKCall:(void(^)(void))call;
- (BOOL)sdkCrashes;

@end

NS_ASSUME_NONNULL_END
