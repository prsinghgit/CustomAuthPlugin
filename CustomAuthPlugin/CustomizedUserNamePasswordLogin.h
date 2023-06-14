//
//  CustomizedUserNamePasswordLogin.h
//  CustomAuthPlugin
//
//  Created by Pushpraj Singh on 14/06/23.
//

#import <Foundation/Foundation.h>
#import <SecurityInterface/SFAuthorizationPluginView.h>
#import <Cocoa/Cocoa.h>



NS_ASSUME_NONNULL_BEGIN

//@interface CustomizedUserNamePasswordLogin : NSObject
//
//@end

@interface EXNameAndPassword : SFAuthorizationPluginView
{
    IBOutlet NSView              *loginView;
    IBOutlet NSTextField         *mNameTextField;
    IBOutlet NSSecureTextField   *passwordTextField;
    IBOutlet NSSecureTextField   *secureCodeTextField;
    IBOutlet NSImageView         *loggedInUserImageView;
    IBOutlet NSButton            *checMark;

    NSString                    *mUserName;
}


@end


NS_ASSUME_NONNULL_END
