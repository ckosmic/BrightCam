#line 1 "Tweak.x"
#import <SpringBoard/SpringBoard.h>

@interface SBBrightnessController : NSObject
	+(id)sharedBrightnessController;
	-(void)setBrightnessLevel:(float)arg1;
@end

@interface SBApplication : NSObject
	-(NSString *)bundleIdentifier;
@end

static double brightnessLevel;
static NSString* prevBundle;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBBrightnessController; @class SBDashBoardCameraPageViewController; @class UIScreen; @class SpringBoard; @class SBDashBoardViewController; 
static void (*_logos_orig$_ungrouped$SpringBoard$frontDisplayDidChange$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$frontDisplayDidChange$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SBDashBoardViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBDashBoardViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBBrightnessController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBBrightnessController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UIScreen(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UIScreen"); } return _klass; }
#line 15 "Tweak.x"
 

static void _logos_method$_ungrouped$SpringBoard$frontDisplayDidChange$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id application) {
	_logos_orig$_ungrouped$SpringBoard$frontDisplayDidChange$(self, _cmd, application);
	if([[application bundleIdentifier] isEqualToString:@"com.apple.camera"] && ![prevBundle isEqualToString:@"com.apple.camera"]) {
		brightnessLevel = [[_logos_static_class_lookup$UIScreen() mainScreen] brightness];
		[[_logos_static_class_lookup$SBBrightnessController() sharedBrightnessController] setBrightnessLevel:1.0];
	} else if([prevBundle isEqualToString:@"com.apple.camera"]) {
		[[_logos_static_class_lookup$SBBrightnessController() sharedBrightnessController] setBrightnessLevel:brightnessLevel];
	}

	prevBundle = [application bundleIdentifier];
}





static void _logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$(self, _cmd, arg1);
	brightnessLevel = [[_logos_static_class_lookup$UIScreen() mainScreen] brightness];
	[[_logos_static_class_lookup$SBBrightnessController() sharedBrightnessController] setBrightnessLevel:1.0];
}

static void _logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidDisappear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidDisappear$(self, _cmd, arg1);
	[[_logos_static_class_lookup$SBBrightnessController() sharedBrightnessController] setBrightnessLevel:brightnessLevel];
}




static void _logos_method$_ungrouped$SBDashBoardViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBDashBoardViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$SBDashBoardViewController$viewDidLoad(self, _cmd);
	brightnessLevel = [[_logos_static_class_lookup$UIScreen() mainScreen] brightness];
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(frontDisplayDidChange:), (IMP)&_logos_method$_ungrouped$SpringBoard$frontDisplayDidChange$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$frontDisplayDidChange$);Class _logos_class$_ungrouped$SBDashBoardCameraPageViewController = objc_getClass("SBDashBoardCameraPageViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardCameraPageViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$);MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardCameraPageViewController, @selector(viewDidDisappear:), (IMP)&_logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidDisappear$, (IMP*)&_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidDisappear$);Class _logos_class$_ungrouped$SBDashBoardViewController = objc_getClass("SBDashBoardViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBDashBoardViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBDashBoardViewController$viewDidLoad);} }
#line 52 "Tweak.x"
