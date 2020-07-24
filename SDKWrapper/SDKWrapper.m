//
//  SDKWrapper.m
//  SDKWrapper
//
//  Created by Brian Donohue on 7/23/20.
//

#import "SDKWrapper.h"

@interface SDKWrapper ()

@property (nonatomic, strong) Class sdk;
@property (nonatomic) BOOL initialized;

@end

@implementation SDKWrapper

- (id)initWithSDK:(Class)sdk {
    self = [super init];
    if (self) {
        self.sdk = sdk;
        self.initialized = NO;
    }
    return self;
}

- (void)initialize:(void(^)(void))initialize {
    if ([self sdkCrashes]) {
        /* Try again on next load */
        [self setSDKCrashes:NO];
        return;
    }
    
    [self setSDKCrashes:YES];
    initialize();
    [self setSDKCrashes:NO];
    self.initialized = YES;
}

- (void)safeSDKCall:(void(^)(void))call {
    if (self.initialized) {
        call();
    }
}

- (NSString *)keyForSDK {
    return [NSString stringWithFormat:@"%@_SDKWrapper_Crashes", NSStringFromClass(self.sdk)];
}

- (BOOL)sdkCrashes {
    return [[[NSUserDefaults standardUserDefaults] objectForKey:[self keyForSDK]] boolValue];
}

- (void)setSDKCrashes:(BOOL)crashes {
    [[NSUserDefaults standardUserDefaults] setObject:@(crashes) forKey:[self keyForSDK]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
