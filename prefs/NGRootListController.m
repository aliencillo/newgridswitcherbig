#include "NGRootListController.h"

@implementation NGRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)respring
{
    //shoutout to angelxwind
    pid_t respringPid;
    char *respringArgv[] = {"/usr/bin/killall", (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_6_0) ? "backboardd" : "SpringBoard", NULL};
    posix_spawn(&respringPid, respringArgv[0], NULL, NULL, respringArgv, NULL);
    waitpid(respringPid, NULL, WEXITED);
}

- (void)openTwitter
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=aliencillo"] options:@{} completionHandler:nil];
    }
    else
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/aliencillo"] options:@{} completionHandler:nil];
    }
}

- (void)openDonate
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/aliencillo"] options:@{} completionHandler:nil];
}

- (void)openSource
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/aliencillo/newgridswitcherbig"] options:@{} completionHandler:nil];
}

@end
