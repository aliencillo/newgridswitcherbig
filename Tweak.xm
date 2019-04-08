/**
 *  NewGridSwitcherBig
 */
// #include "BSPlatform.h"
#import "Headers.h"

//static int SWITCHER_STYLE = 2; // 0 = auto, 1 = deck, 2 = grid, 3 = minimum viable
//static double SWITCHER_PAGESCALE = 0.35;
//static double VerticalNaturalSpacingPortrait = 48;
//static double HorizontalInterpageSpacingPortrait = 40;
//static double VerticalNaturalSpacingLandscape = 40;
//static double HorizontalInterpageSpacingLandscape = 32;

#define PLIST_PATH @"/var/mobile/Library/Preferences/pro.aliencillo.newgridswitcherbigprefs.plist"
 
inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

inline double GetPrefDouble(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] doubleValue];
}

%hook NSObject
@interface NSObject (customObject)
- (BOOL)isSettingOn:(NSString *)keyStr;
@end


%new
- (BOOL)isSettingOn:(NSString *)keyStr
{
  const char *keyStrC = [keyStr cStringUsingEncoding:NSUTF8StringEncoding];
  CFPreferencesAppSynchronize(CFSTR("pro.aliencillo.newgridswitcherbigprefs"));
  CFPropertyListRef value = CFPreferencesCopyAppValue(CFStringCreateWithCString(NULL, keyStrC, kCFStringEncodingUTF8), CFSTR("pro.aliencillo.newgridswitcherbigprefs"));

  NSString *valueString = [NSString stringWithFormat:@"%@", value];
  NSString *noVal = @"0";

  if ([valueString isEqualToString:noVal])
  {
    return NO;
  }
  else
  {
    return YES;
  }
}
%end


%hook SBGridSwitcherPersonality
-(bool)scrollViewPagingEnabled  {
  if (GetPrefBool(@"scrollViewPagingEnabled"))
  {
    return true;
  }
  else
  {
    return false;
  }
}
-(double)titleAndIconOpacityForIndex:(unsigned long long)arg1 {
  if (GetPrefBool(@"titleAndIconOpacityForIndex"))
  {
    return 0;
  }
  else
  {
    return %orig(arg1);
  }
}
%end


%hook SBAppSwitcherSettings
-(void)setSwitcherStyle:(long)arg1 {
   if (GetPrefBool(@"SWITCHER_STYLE"))
  {
    static int SWITCHER_STYLE = 2;
    %orig(SWITCHER_STYLE);
  }
  else
  {
    static int SWITCHER_STYLE = 1;
    %orig(SWITCHER_STYLE);
  }
}
-(void)setGridSwitcherPageScale:(double)arg1 {
  double newValue = GetPrefDouble(@"SWITCHER_PAGESCALE"); 
  //int y = (int) newValue;
  //newValue = scanf("%.2f",&newValue);
  newValue = ((int)(newValue * 100 + .5) / 100.0);
  NSObject *object = [[NSObject alloc] init];
  BOOL isSettingOn = [object isSettingOn:@"SWITCHER_PAGESCALE"];
  if (isSettingOn)
  {
    return %orig(newValue);
  }
  else
  {
    return %orig(0.3500);
  }
}
-(void)setGridSwitcherVerticalNaturalSpacingPortrait:(double)arg1 {
  int newValue = GetPrefDouble(@"VerticalNaturalSpacingPortrait"); 
  NSObject *object = [[NSObject alloc] init];
  BOOL isSettingOn = [object isSettingOn:@"VerticalNaturalSpacingPortrait"];
  if (isSettingOn)
  {
    return %orig(newValue);
  }
  else
  {
    return %orig;
  }
}
-(void)setGridSwitcherHorizontalInterpageSpacingPortrait:(double)arg1 {
  int newValue = GetPrefDouble(@"HorizontalInterpageSpacingPortrait"); 
  NSObject *object = [[NSObject alloc] init];
  BOOL isSettingOn = [object isSettingOn:@"HorizontalInterpageSpacingPortrait"];
  if (isSettingOn)
  {
    return %orig(newValue);
  }
  else
  {
    return %orig;
  }
}

-(void)setGridSwitcherVerticalNaturalSpacingLandscape:(double)arg1 {
  int newValue = GetPrefDouble(@"VerticalNaturalSpacingLandscape"); 
  NSObject *object = [[NSObject alloc] init];
  BOOL isSettingOn = [object isSettingOn:@"VerticalNaturalSpacingLandscape"];
  if (isSettingOn)
  {
    return %orig(newValue);
  }
  else
  {
    return %orig;
  }
}
-(void)setGridSwitcherHorizontalInterpageSpacingLandscape:(double)arg1 {
  int newValue = GetPrefDouble(@"HorizontalInterpageSpacingLandscape"); 
  NSObject *object = [[NSObject alloc] init];
  BOOL isSettingOn = [object isSettingOn:@"HorizontalInterpageSpacingLandscape"];
  if (isSettingOn)
  {
    return %orig(newValue);
  }
  else
  {
    return %orig;
  }
}

%end
