//
//  CustomizedUserNamePasswordLogin.m
//  CustomAuthPlugin
//
//  Created by Pushpraj Singh on 14/06/23.
//

#import "CustomizedUserNamePasswordLogin.h"
#import <Cocoa/Cocoa.h>


@implementation EXNameAndPassword

- (void)buttonPressed:(SFButtonType)inButtonType
{
    NSString *userNameString;
    NSNumber *number = @1234;

        userNameString = [mNameTextField stringValue];
    
    // if the OK button was pressed, write the identity and credentials and allow authorization,
    //  otherwise, if the cancel button was pressed, cancel the authorization
    if (inButtonType == SFButtonTypeOK)
    {
        const char *userName = [userNameString UTF8String];
        const char *password = [[passwordTextField stringValue] UTF8String];
        AuthorizationValue userNameValue = { strlen(userName), (char*)userName };
        AuthorizationValue userPasswordValue = { strlen(password), (char*)password };
        
        // add the username and password to the context values
        [self callbacks]->SetContextValue([self engineRef], kAuthorizationEnvironmentUsername, 0, &userNameValue);
        [self callbacks]->SetContextValue([self engineRef], kAuthorizationEnvironmentPassword, 0, &userPasswordValue);
        NSInteger integerValue = [secureCodeTextField.stringValue integerValue];

        // allow authorization
        if ([number isEqualToNumber:@(integerValue)]) {
        [self callbacks]->SetResult([self engineRef], kAuthorizationResultAllow);
        }
    }
    else if (inButtonType == SFButtonTypeCancel)
    {
        // cancel authorization
        [self callbacks]->SetResult([self engineRef], kAuthorizationResultUserCanceled);
    }
}

- (NSView *)firstKeyView
{
        return mNameTextField;
}

- (NSView *)firstResponderView
{
    NSView                    *view;
    
        if ([[mNameTextField stringValue] length] == 0)
        {
            view = mNameTextField;
        }
        else
        {
            view = passwordTextField;
        }
    return view;
}

- (NSView *)lastKeyView
{
        return passwordTextField;
}

- (void)setEnabled:(BOOL)inEnabled
{
    // enable or disable the text fields as appropriate
    [mNameTextField setEnabled: inEnabled];
    [passwordTextField setEnabled: inEnabled];
    [secureCodeTextField setEnabled: inEnabled];
    [loggedInUserImageView setEnabled: inEnabled];
    [checMark setEnabled: inEnabled];
}

- (void)willActivateWithUser:(NSDictionary *)inUserInformation
{
    // save the user name and set the name text field
    mUserName = [inUserInformation objectForKey: SFAuthorizationPluginViewUserShortNameKey];
    if (mUserName)
    {
        [mNameTextField setStringValue: mUserName];
    }
}

- (NSView*)viewForType:(SFViewType)inType
{
    return loginView;
}

// --------------------------------------------------------------------------------
- (id)initWithCallbacks:(const AuthorizationCallbacks *)callbacks andEngineRef:(AuthorizationEngineRef)engineRef
{
    self = [super initWithCallbacks: callbacks andEngineRef: engineRef];
    if (self)
    {
        // do any additional initialization
    }
    return self;
}



@end
