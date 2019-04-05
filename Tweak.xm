/**
 * 
 */
#include "BSPlatform.h"

static int SWITCHER_STYLE = 2; // 0 = auto, 1 = deck, 2 = grid, 3 = minimum viable
static double SWITCHER_PAGESCALE = 0.35;
static double VerticalNaturalSpacingPortrait = 48;
static double HorizontalInterpageSpacingPortrait = 32;
static double VerticalNaturalSpacingLandscape = 45;
static double HorizontalInterpageSpacingLandscape = 32;

%hook SBAppSwitcherSettings
-(void)setSwitcherStyle:(NSInteger)style {
	%orig(SWITCHER_STYLE);
}
-(void)setGridSwitcherPageScale:(double)arg1 {
	%orig(SWITCHER_PAGESCALE);
}
-(void)setGridSwitcherVerticalNaturalSpacingPortrait:(double)arg1 {
	%orig(VerticalNaturalSpacingPortrait);
}
-(void)setGridSwitcherHorizontalInterpageSpacingPortrait:(double)arg1 {
	%orig(HorizontalInterpageSpacingPortrait);
}

-(void)setGridSwitcherVerticalNaturalSpacingLandscape:(double)arg1 {
	%orig(VerticalNaturalSpacingLandscape);
}
-(void)setGridSwitcherHorizontalInterpageSpacingLandscape:(double)arg1 {
	%orig(HorizontalInterpageSpacingLandscape);
}

%end
