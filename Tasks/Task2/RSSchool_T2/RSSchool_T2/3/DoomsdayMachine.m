#import "DoomsdayMachine.h"
#import "Wrapper.h"
@implementation DoomsdayMachine
- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    return [Wrapper wrapperMethod:dateString];
}


- (NSString *)doomsdayString {
    NSString * assimilatioDate = @"14 August 2208 03:13:37";
    NSDateFormatter *formatter1 = [[[NSDateFormatter alloc] init] autorelease];
    formatter1.dateFormat = @"dd MMMM yyyy HH:mm:ss";
    NSDate *assimilationDateAbsoulute = [formatter1 dateFromString:assimilatioDate];
    NSDateFormatter * formatter2 = [[[NSDateFormatter alloc] init] autorelease];
    formatter2.dateFormat = @"EEEE, MMMM dd, yyyy";
    return [NSString stringWithFormat:@"%@", [formatter2 stringFromDate:assimilationDateAbsoulute]];
}

@end
