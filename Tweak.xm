/**
 * 
 */
#include "BSPlatform.h"

static int SWITCHER_STYLE = 2; // 0 = auto, 1 = deck, 2 = grid, 3 = minimum viable
static double SWITCHER_PAGESCALE = 0.38;

%hook SBAppSwitcherSettings
-(void)setSwitcherStyle:(NSInteger)style {
	%orig(SWITCHER_STYLE);
}
-(void)setGridSwitcherPageScale:(double)arg1 {
	%orig(SWITCHER_PAGESCALE);
}

%end
