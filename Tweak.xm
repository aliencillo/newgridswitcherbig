/**
 *  NewGridSwitcherBig
 */

 #import "Headers.h"

//static int SWITCHER_STYLE = 2; // 0 = auto, 1 = deck, 2 = grid, 3 = minimum viable
//static double SWITCHER_PAGESCALE = 0.35;
//static double VerticalNaturalSpacingPortrait = 48;
//static double HorizontalInterpageSpacingPortrait = 40;
//static double VerticalNaturalSpacingLandscape = 40;
//static double HorizontalInterpageSpacingLandscape = 32;

#define PLIST_PATH @"/var/mobile/Library/Preferences/pro.aliencillo.newgridswitcherbigprefs.plist"
inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

%hook SBAppSwitcherSettings
-(void)setSwitcherStyle:(int)arg1 {
	int newValue = GetPrefInt(@"SwitcherType");
    if (newValue == 2)
	{
	%orig(2);
	}
	else if (newValue == 3)
	{
	%orig(2);
	}
	else if (newValue == 4)
	{
	%orig(2);
	}
	else
	{
	%orig(1);
	}
}
-(void)setGridSwitcherPageScale:(double)arg1 {
    int newValue = GetPrefInt(@"SwitcherType");
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
	if (newValue == 2)
	{
	%orig(0.25);
	}
	else if (newValue == 3)
	{
	%orig(0.35);
	}
	//else if ((newValue == 3) && (orientation == UIInterfaceOrientationLandscapeLeft))
	//{
	//%orig(0.25);
	//}
	//else if ((newValue == 3) && (orientation == UIInterfaceOrientationLandscapeRight))
	//{
	//%orig(0.25);
	//}
	else if (newValue == 4)
	{
	%orig(0.50);
	}
	else
	{
	%orig;
	}
 }
 -(void)setGridSwitcherVerticalNaturalSpacingPortrait:(double)arg1 {
	int newValue = GetPrefInt(@"SwitcherType");
    if (newValue == 3)
	{
    %orig(44);
	}
	else if (newValue == 4)
	{
	%orig(0);
	}
	else
	{
    %orig;
	}
}
-(void)setGridSwitcherHorizontalInterpageSpacingPortrait:(double)arg1 {
    int newValue = GetPrefInt(@"SwitcherType");
    if (newValue == 3)
	{
    %orig(32);
	}
	else if (newValue == 4)
	{
	%orig(0);
	}
	else
	{
    %orig;
	}
}
-(void)setGridSwitcherVerticalNaturalSpacingLandscape:(double)arg1 {
    int newValue = GetPrefInt(@"SwitcherType");
	if (newValue == 3)
	{
    %orig(44);
	}
	else if (newValue == 4)
	{
	%orig(0);
	}
	else
	{
    %orig;
	}
}
-(void)setGridSwitcherHorizontalInterpageSpacingLandscape:(double)arg1 {
    int newValue = GetPrefInt(@"SwitcherType");
	if (newValue == 3)
	{
    %orig(30);
	}
	else if (newValue == 4)
	{
	%orig(0);
	}
	else
	{
    %orig;
	}
}
%end

%hook SBGridSwitcherPersonality
	-(bool)scrollViewPagingEnabled  {
	int newValue = GetPrefInt(@"SwitcherType");
    if (newValue == 2)
	{
	return false;
	}
	else if (newValue == 3)
	{
	return false;
	}
	else if (newValue == 4)
	{
	return true;
	}
	else
	{
	return false;
	}
}
-(double)titleAndIconOpacityForIndex:(unsigned long long)arg1 {
	int newValue = GetPrefInt(@"SwitcherType");
    if (newValue == 2)
	{
	return %orig(arg1);
	}
	else if (newValue == 3)
	{
	return %orig(arg1);
	}
	else if (newValue == 4)
	{
	return 0;
	}
	else
	{
	return %orig(arg1);
	}
}
%end
