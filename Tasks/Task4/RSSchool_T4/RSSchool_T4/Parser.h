#import <Foundation/Foundation.h>

@interface PhoneNumber: NSObject
@property (nonatomic, retain) NSString *stringPrefix;
@property (nonatomic, retain) NSString *phoneNumaber;
@property (nonatomic, retain) NSString *outputString;
@property (nonatomic, assign) NSInteger phoneNumberLength;
@end

@interface Parser : NSObject
+(PhoneNumber *)parsePhoneNumaber:(NSString *)inputString;
@end

