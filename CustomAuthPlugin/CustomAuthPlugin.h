//
//  CustomAuthPlugin.h
//  CustomAuthPlugin
//
//  Created by Pushpraj Singh on 14/06/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "plugIn.h"
#import "CustomizedUserNamePasswordLogin.h"


NS_ASSUME_NONNULL_BEGIN

@interface EXAuthPlugin : EXAuthorizationPlugin {}
- (id)mechanism:(AuthorizationMechanismId)mechanismId engineRef:(AuthorizationEngineRef)inEngine;
@end

@interface EXAuthPluginMechanism : EXAuthorizationMechanism
{
    EXNameAndPassword            *mNameAndPassword;
}
- (OSStatus)invoke;
@end

NS_ASSUME_NONNULL_END
