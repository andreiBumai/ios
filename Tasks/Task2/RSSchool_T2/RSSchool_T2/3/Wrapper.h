#import <Foundation/Foundation.h>
#import "DoomsdayMachine.h"

NS_ASSUME_NONNULL_BEGIN
@interface Wrapper : NSObject <AssimilationInfo>
@property (nonatomic, readonly) NSInteger years;
@property (nonatomic, readonly) NSInteger months;
@property (nonatomic, readonly) NSInteger weeks;
@property (nonatomic, readonly) NSInteger days;
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger seconds;
+(instancetype) wrapperMethod: (NSString*) string;
@end
NS_ASSUME_NONNULL_END
