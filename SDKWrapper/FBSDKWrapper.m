//
//  FBSDKWrapper.m
//  SDKWrapper
//
//  Created by Brian Donohue on 7/23/20.
//

#import "FBSDKWrapper.h"

@import FBSDKCoreKit;

@implementation FBSDKWrapper


+ (SDKWrapper *)sharedInstance {
    static dispatch_once_t once;
    static SDKWrapper *FBSDKWrapper;
    dispatch_once(&once, ^{
        FBSDKWrapper = [[SDKWrapper alloc] initWithSDK:FBSDKApplicationDelegate.class];
    });
    return FBSDKWrapper;
}


@end
