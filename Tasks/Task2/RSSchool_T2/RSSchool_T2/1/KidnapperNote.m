#import "KidnapperNote.h"

@implementation KidnapperNote
- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
    
    
    
    NSString * temporaryStringFromMagazine = [[[NSString alloc] initWithString:magaine] lowercaseString];
    NSString * temporaryStringFromNote = [[[NSString alloc] initWithString:note] lowercaseString];
    
    NSArray * substringFromMagazine = [temporaryStringFromMagazine componentsSeparatedByString: @" "];
    NSArray * substringFromNote = [temporaryStringFromNote componentsSeparatedByString:@" "];
    
    NSCountedSet * setFromMagazine = [[NSCountedSet alloc] initWithArray:substringFromMagazine];
    NSCountedSet * setFromNote =[[NSCountedSet alloc]  initWithArray:substringFromNote];
    
    __block BOOL result = YES;
    if ([setFromNote isSubsetOfSet:setFromMagazine]) {
        [setFromNote enumerateObjectsUsingBlock:^(NSString* obj, BOOL * _Nonnull stop) {
            if ([setFromMagazine countForObject:obj] < [setFromNote countForObject:obj]) {
                result= YES;
                *stop;
            }
        }];
    } else result = NO;
    
    [setFromMagazine release];
    [setFromNote release];
    return  result;
   // your code here
}
@end
