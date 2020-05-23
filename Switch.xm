#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface ColorFilterBlueYellowSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSBlueYellowFilterEnabled();
extern "C" void _AXSBlueYellowFilterSetEnabled(BOOL);

@implementation ColorFilterBlueYellowSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSBlueYellowFilterEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSBlueYellowFilterSetEnabled(newState == FSSwitchStateOn);
}

@end
