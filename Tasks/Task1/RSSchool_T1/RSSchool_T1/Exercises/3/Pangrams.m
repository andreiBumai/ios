#import "Pangrams.h"

@implementation Pangrams

// Complete the pangrams function below.
- (BOOL)pangrams:(NSString *)string {
   
    NSString *tmpString = [[NSString alloc] initWithString:[string lowercaseString]];
    NSString *alphabetString = @"abcdefghijklmnopqrstuvwxyz ";
    
    NSMutableSet *tmpSetFromAlphabetString = [[NSMutableSet alloc] initWithCapacity:[alphabetString length]];
    
    for (int i=0; i < [alphabetString length]; i++) {
        NSString *iCharAlphabet  = [NSString stringWithFormat:@"%c", [alphabetString characterAtIndex:i]];
        [tmpSetFromAlphabetString addObject:iCharAlphabet];
    }
    
    
    NSMutableSet *tmpSetFromTmpString = [[NSMutableSet alloc] initWithCapacity:[tmpString length]];
    
    for (int i=0; i < [tmpString length]; i++) {
        NSString *iCharFromTmpString  = [NSString stringWithFormat:@"%c", [tmpString characterAtIndex:i]];
        [tmpSetFromTmpString addObject:iCharFromTmpString];
    }
    return [tmpSetFromTmpString isEqual:tmpSetFromAlphabetString];
    
}

@end
