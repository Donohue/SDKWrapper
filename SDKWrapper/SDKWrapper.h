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
- (BOOL)sdkCrashes;

@end

NS_ASSUME_NONNULL_END
