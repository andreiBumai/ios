#import "Parser.h"

@implementation PhoneNumber

-(void)dealloc {
    self.phoneNumaber = nil;
    self.stringPrefix = nil;
    self.outputString = nil;
    [super dealloc];
}

@end

@implementation Parser

+(PhoneNumber *)parsePhoneNumaber:(NSString *)rawValue {
    PhoneNumber *phoneNumber = [[PhoneNumber new] autorelease];
    phoneNumber.phoneNumaber = rawValue;
    NSString *pureNumbers = [[rawValue componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
    NSMutableString *formattedString = [pureNumbers mutableCopy];
    if(![[formattedString substringWithRange:NSMakeRange(0, 1)] isEqual:@"+"]) {
        [formattedString insertString:@"+" atIndex:0];
    }
    for(NSString *key in self.phoneNumberLength) {
        if([pureNumbers hasPrefix:key]) {
            phoneNumber.phoneNumberLength = [[[Parser phoneNumberLength] valueForKey:key] integerValue];
            phoneNumber.stringPrefix = key;
            break;
        }
    }
    
    if(phoneNumber.stringPrefix) {
        if((int)phoneNumber.phoneNumberLength == 8 || (int)phoneNumber.phoneNumberLength == 9) {
            if(pureNumbers.length == phoneNumber.stringPrefix.length + 1) {
                [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
            }
            else if(pureNumbers.length >= phoneNumber.stringPrefix.length + 2 && pureNumbers.length <= phoneNumber.stringPrefix.length + 5) {
                [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
                [formattedString insertString:@") " atIndex:phoneNumber.stringPrefix.length + 5];
            }
            else if(pureNumbers.length > phoneNumber.stringPrefix.length + 5 && pureNumbers.length <= phoneNumber.stringPrefix.length + 7) {
                [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
                [formattedString insertString:@") " atIndex:phoneNumber.stringPrefix.length + 5];
                [formattedString insertString:@"-" atIndex:phoneNumber.stringPrefix.length + 10];
                
            }
            if((int)phoneNumber.phoneNumberLength == 8) {
                if(pureNumbers.length == phoneNumber.stringPrefix.length + 8) {
                    [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
                    [formattedString insertString:@") " atIndex:phoneNumber.stringPrefix.length + 5];
                    [formattedString insertString:@"-" atIndex:phoneNumber.stringPrefix.length + 10];
                }
            }
            else if((int)phoneNumber.phoneNumberLength == 9) {
                if(pureNumbers.length >= phoneNumber.stringPrefix.length + 8) {
                    [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
                    [formattedString insertString:@") " atIndex:phoneNumber.stringPrefix.length + 5];
                    [formattedString insertString:@"-" atIndex:phoneNumber.stringPrefix.length + 10];
                    [formattedString insertString:@"-" atIndex:phoneNumber.stringPrefix.length + 13];
                }
            }
            
        }
        else if((int)phoneNumber.phoneNumberLength == 10) {
            if(pureNumbers.length > phoneNumber.stringPrefix.length && pureNumbers.length < phoneNumber.stringPrefix.length + 3) {
                [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
            }
            else if(pureNumbers.length >= phoneNumber.stringPrefix.length + 3 && pureNumbers.length <= phoneNumber.stringPrefix.length + 6) {
                [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
                [formattedString insertString:@") " atIndex:phoneNumber.stringPrefix.length + 6];
            }
            else if(pureNumbers.length > phoneNumber.stringPrefix.length + 6 && pureNumbers.length <= phoneNumber.stringPrefix.length + 8) {
                [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
                [formattedString insertString:@") " atIndex:phoneNumber.stringPrefix.length + 6];
                [formattedString insertString:@" " atIndex:phoneNumber.stringPrefix.length + 11];
            }
            else if(pureNumbers.length > phoneNumber.stringPrefix.length + 8) {
                [formattedString insertString:@" (" atIndex:phoneNumber.stringPrefix.length + 1];
                [formattedString insertString:@") " atIndex:phoneNumber.stringPrefix.length + 6];
                [formattedString insertString:@" " atIndex:phoneNumber.stringPrefix.length + 11];
                [formattedString insertString:@" " atIndex:phoneNumber.stringPrefix.length + 14];
            }
        }
    }
    phoneNumber.outputString = formattedString;
    [formattedString release];
    return phoneNumber;
}

+ (NSDictionary *)phoneNumberLength {
    return @{@"7": @(10),
             @"373": @(8),
             @"374": @(8),
             @"375": @(9),
             @"380": @(9),
             @"992": @(9),
             @"993": @(8),
             @"994": @(9),
             @"996": @(9),
             @"998": @(9)
             };
}

@end
