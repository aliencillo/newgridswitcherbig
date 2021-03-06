/**
 *  NewGridSwitcherBig
 */

#import "BSPlatform.h"

//static int SwitcherStyle = 2; // 0 = auto, 1 = deck, 2 = grid, 3 = minimum viable
//static double SwitcherPageScale = 0.35;
//static double VerticalNaturalSpacingPortrait = 48;
//static double HorizontalInterpageSpacingPortrait = 40;
//static double VerticalNaturalSpacingLandscape = 40;
//static double HorizontalInterpageSpacingLandscape = 32;

#define PLIST_PATH @"/var/mobile/Library/Preferences/pro.aliencillo.newgridswitcherbig.plist"
inline int GetPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}
inline bool GetPrefBool(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}
inline double GetPrefDouble(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] doubleValue];
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
	else if (newValue == 5)
	{
	%orig(2);
	}
	else if (newValue == 6)
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
    //UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
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
	%orig(0.40);
	}
	else if (newValue == 5)
	{
	%orig(0.50);
	}
	else if (newValue == 6)
	{
	double scaleValue = GetPrefDouble(@"SwitcherPageScale"); 
	//scaleValue = ((double)(scaleValue * 100 + .5) / 100.0);
	%orig(scaleValue);
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
    %orig(46);
	}
	else if (newValue == 5)
	{
	%orig(0);
	}
    else if (newValue == 6)
	{
	int PosValue = GetPrefInt(@"VerticalNaturalSpacingPortrait");
	%orig(PosValue);
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
    %orig(38);
	}
	else if (newValue == 5)
	{
	%orig(0);
	}
	else if (newValue == 6)
	{
	int PosValue = GetPrefInt(@"HorizontalInterpageSpacingPortrait");
	%orig(PosValue);
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
	else if (newValue == 5)
	{
	%orig(0);
	}
	else if (newValue == 6)
	{
	int PosValue = GetPrefInt(@"VerticalNaturalSpacingLandscape");
	%orig(PosValue);
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
    %orig(38);
	}
	else if (newValue == 5)
	{
	%orig(0);
	}
	else if (newValue == 6)
	{
	int PosValue = GetPrefInt(@"HorizontalInterpageSpacingLandscape");
	%orig(PosValue);
	}
	else
	{
    %orig;
	}
}
%end

%hook SBGridSwitcherPersonality
	-(bool)scrollViewPagingEnabled  {
	int newValue = GetPrefInt(@"scrollViewPagingEnabled");
	if (newValue == 1)
	{
	return %orig;
	}
	else
	{
	return true;
	}
}
-(double)titleAndIconOpacityForIndex:(unsigned long long)arg1 {
	int newValue = GetPrefInt(@"titleAndIconOpacityForIndex");
	//if (newValue == 2)
	//{
	//return %orig(arg1);
	//}
	//else if (newValue == 3)
	//{
	//return %orig(arg1);
	//}
	//else if (newValue == 4)
	//{
	//return 0;
	//}
	if (newValue == 3)
	{
	return 0;
	}
	else
	{
	return %orig;
	}
}

-(double)titleOpacityForIndex:(unsigned long long)arg1 { 
	int newValue = GetPrefInt(@"titleAndIconOpacityForIndex");
	if (newValue == 2)
	{
	return 0;
	} 
	else
	{
	return %orig;
	}
}

%end

%hook SpringBoard
-(void)applicationDidFinishLaunching:(id)application {
	%orig;
	//bool newValue = GetPrefInt(@"titleAndIconOpacityForIndex");
	//BOOL a = YES;	
	//NSString valor = NSLog(@"Value is %i",newValue);
	//UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hi Akash" 
		//message:@"Headphone present" 
		//delegate:nil 
		//cancelButtonTitle:@"I Know" 
		//otherButtonTitles:nil];
	//[alert show];
	//[alert release];
}
%end
