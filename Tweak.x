#include <SpringBoard/SpringBoard.h>

@interface SBBrightnessController : NSObject
	+(id)sharedBrightnessController;
	-(void)setBrightnessLevel:(float)arg1;
@end
@interface CAMViewfinderViewController : UIViewController
@end

// The stored brightness level before setting it to 1.0
static double brightnessLevel;

%hook CAMViewfinderViewController

-(void)viewDidAppear:(BOOL)arg1 {
	%orig;
	// Add listeners for when the app opens/closes
	[[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(camClosed) 
        name:UIApplicationWillResignActiveNotification
        object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(camClosed) 
        name:UIApplicationWillTerminateNotification
        object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(camOpened) 
        name:UIApplicationDidBecomeActiveNotification
        object:nil];
}

%new
-(void) camOpened {
	double sBrightness = [[%c(UIScreen) mainScreen] brightness];
	if(sBrightness < 1.0)
		brightnessLevel = sBrightness;
	[%c(UIScreen) mainScreen].brightness = 1.0;
}

%new
-(void) camClosed {
	[%c(UIScreen) mainScreen].brightness = brightnessLevel;
}

%end

// This hook makes the tweak work on the lock screen version of the camera
%hook SBDashBoardCameraPageViewController

-(void)viewDidAppear:(BOOL)arg1 {
	%orig;
	double sBrightness = [[%c(UIScreen) mainScreen] brightness];
	if(sBrightness < 1.0)
		brightnessLevel = sBrightness;
	// For some reason, SBBrightnessController has to be used on the LS version instead
	[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:1.0];
}

-(void)viewWillDisappear:(BOOL)arg1 {
	%orig;
	[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:brightnessLevel];
}

%end

// Initialize globals
%hook CSCoverSheetViewController
-(void)viewDidLoad {
	%orig;
	brightnessLevel = [[%c(UIScreen) mainScreen] brightness];
}
%end