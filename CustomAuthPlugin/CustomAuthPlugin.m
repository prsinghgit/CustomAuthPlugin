//
//  CustomAuthPlugin.m
//  CustomAuthPlugin
//
//  Created by Pushpraj Singh on 14/06/23.
//

#import "CustomAuthPlugin.h"

@implementation EXAuthPlugin

-(id)mechanism:(AuthorizationMechanismId)mechanismId engineRef:(AuthorizationEngineRef)inEngine
{
    if (!strcmp(mechanismId, "invoke"))
    {
        // for the invoke mechanism return a instance of the AuthPluginMechanism
        return [[EXAuthPluginMechanism alloc] initWithPlugin:self engineRef:inEngine];
    }
    
    return nil;
}
@end

@implementation EXAuthPluginMechanism

- (OSStatus)invoke
{
    if (mNameAndPassword == nil)
    {
        mNameAndPassword = [[EXNameAndPassword alloc] initWithCallbacks: [mPluginRef engineCallback] andEngineRef: mEngineRef];
    }

    if (mNameAndPassword)
    {
        [mNameAndPassword displayView];
    }
    
    return noErr;
}

//- (void)dealloc
//{
//    if (mNameAndPassword)
//    {
//        [mNameAndPassword release];
//    }
//
//    [super dealloc];
//}

@end
