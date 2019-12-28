#import <SpringBoard/SpringBoard.h>

@interface SBBrightnessController : NSObject
	+(id)sharedBrightnessController;
	-(void)setBrightnessLevel:(float)arg1;
@end

@interface SBApplication : NSObject
	-(NSString *)bundleIdentifier;
@end

// The brightness level before setting it to 1.0
static double brightnessLevel;
// The bundle identifier of the previously shown application
static NSString* prevBundle;

// This hook makes the tweak work on the SpringBoard version of the camera
%hook SpringBoard 

-(void)frontDisplayDidChange:(id)application {
	%orig;
	if([[application bundleIdentifier] isEqualToString:@"com.apple.camera"] && ![prevBundle isEqualToString:@"com.apple.camera"]) {
		brightnessLevel = [[%c(UIScreen) mainScreen] brightness];
		[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:1.0];
	} else if([prevBundle isEqualToString:@"com.apple.camera"]) {
		[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:brightnessLevel];
	}

	prevBundle = [application bundleIdentifier];
}

%end

// This hook makes the tweak work on the lock screen version of the camera
%hook SBDashBoardCameraPageViewController

-(void)viewDidAppear:(BOOL)arg1 {
	%orig;
	brightnessLevel = [[%c(UIScreen) mainScreen] brightness];
	[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:1.0];
}

-(void)viewWillDisappear:(BOOL)arg1 {
	%orig;
	[[%c(SBBrightnessController) sharedBrightnessController] setBrightnessLevel:brightnessLevel];
}

%end

// Initialize globals
%hook SBDashBoardViewController
-(void)viewDidLoad {
	%orig;
	brightnessLevel = [[%c(UIScreen) mainScreen] brightness];
}
%end