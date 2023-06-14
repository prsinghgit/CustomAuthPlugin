//
//  main.m
//  CustomAuthPlugin
//
//  Created by Pushpraj Singh on 14/06/23.
//

#import <Foundation/Foundation.h>
#import "CustomAuthPlugin.h"

OSStatus
AuthorizationPluginCreate(const AuthorizationCallbacks *callbacks,
                          AuthorizationPluginRef *outPlugin,
                          const AuthorizationPluginInterface **outPluginInterface)
{
    *outPlugin = (__bridge AuthorizationPluginRef)([[EXAuthPlugin alloc] initWithCallbacks:callbacks pluginInterface:outPluginInterface]);
    return noErr;
}
