#line 1 "Tweak.x"
#include <SpringBoard/SpringBoard.h>

@interface SBBrightnessController : NSObject
	+(id)sharedBrightnessController;
	-(void)setBrightnessLevel:(float)arg1;
@end
@interface CAMViewfinderViewController : UIViewController
@end


static double brightnessLevel;


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

@class UIScreen; @class CSCoverSheetViewController; @class SBBrightnessController; @class SBDashBoardCameraPageViewController; @class CAMViewfinderViewController; 
static void (*_logos_orig$_ungrouped$CAMViewfinderViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL CAMViewfinderViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CAMViewfinderViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL CAMViewfinderViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$CAMViewfinderViewController$camOpened(_LOGOS_SELF_TYPE_NORMAL CAMViewfinderViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CAMViewfinderViewController$camClosed(_LOGOS_SELF_TYPE_NORMAL CAMViewfinderViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewWillDisappear$)(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$CSCoverSheetViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$CSCoverSheetViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBBrightnessController(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBBrightnessController"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$UIScreen(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("UIScreen"); } return _klass; }
#line 13 "Tweak.x"


static void _logos_method$_ungrouped$CAMViewfinderViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL CAMViewfinderViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$CAMViewfinderViewController$viewDidAppear$(self, _cmd, arg1);
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


static void _logos_method$_ungrouped$CAMViewfinderViewController$camOpened(_LOGOS_SELF_TYPE_NORMAL CAMViewfinderViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	double sBrightness = [[_logos_static_class_lookup$UIScreen() mainScreen] brightness];
	if(sBrightness < 1.0)
		brightnessLevel = sBrightness;
	[_logos_static_class_lookup$UIScreen() mainScreen].brightness = 1.0;
}


static void _logos_method$_ungrouped$CAMViewfinderViewController$camClosed(_LOGOS_SELF_TYPE_NORMAL CAMViewfinderViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	[_logos_static_class_lookup$UIScreen() mainScreen].brightness = brightnessLevel;
}























static void _logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$(self, _cmd, arg1);
	double sBrightness = [[_logos_static_class_lookup$UIScreen() mainScreen] brightness];
	if(sBrightness < 1.0)
		brightnessLevel = sBrightness;
	[[_logos_static_class_lookup$SBBrightnessController() sharedBrightnessController] setBrightnessLevel:1.0];
}

static void _logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewWillDisappear$(_LOGOS_SELF_TYPE_NORMAL SBDashBoardCameraPageViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1) {
	_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewWillDisappear$(self, _cmd, arg1);
	[[_logos_static_class_lookup$SBBrightnessController() sharedBrightnessController] setBrightnessLevel:brightnessLevel];
}





static void _logos_method$_ungrouped$CSCoverSheetViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL CSCoverSheetViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	_logos_orig$_ungrouped$CSCoverSheetViewController$viewDidLoad(self, _cmd);
	brightnessLevel = [[_logos_static_class_lookup$UIScreen() mainScreen] brightness];
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CAMViewfinderViewController = objc_getClass("CAMViewfinderViewController"); MSHookMessageEx(_logos_class$_ungrouped$CAMViewfinderViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$CAMViewfinderViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$CAMViewfinderViewController$viewDidAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CAMViewfinderViewController, @selector(camOpened), (IMP)&_logos_method$_ungrouped$CAMViewfinderViewController$camOpened, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$CAMViewfinderViewController, @selector(camClosed), (IMP)&_logos_method$_ungrouped$CAMViewfinderViewController$camClosed, _typeEncoding); }Class _logos_class$_ungrouped$SBDashBoardCameraPageViewController = objc_getClass("SBDashBoardCameraPageViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardCameraPageViewController, @selector(viewDidAppear:), (IMP)&_logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$, (IMP*)&_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewDidAppear$);MSHookMessageEx(_logos_class$_ungrouped$SBDashBoardCameraPageViewController, @selector(viewWillDisappear:), (IMP)&_logos_method$_ungrouped$SBDashBoardCameraPageViewController$viewWillDisappear$, (IMP*)&_logos_orig$_ungrouped$SBDashBoardCameraPageViewController$viewWillDisappear$);Class _logos_class$_ungrouped$CSCoverSheetViewController = objc_getClass("CSCoverSheetViewController"); MSHookMessageEx(_logos_class$_ungrouped$CSCoverSheetViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$CSCoverSheetViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$CSCoverSheetViewController$viewDidLoad);} }
#line 88 "Tweak.x"
