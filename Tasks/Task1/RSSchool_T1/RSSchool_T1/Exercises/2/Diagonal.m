#import "Diagonal.h"


@interface Diagonal ()
@property(nonatomic, strong) NSMutableArray *myArray1;
@end

@implementation Diagonal

// Complete the diagonalDifference function below.
- (NSNumber *) diagonalDifference:(NSArray *)array {
    _myArray1 = [[NSMutableArray alloc] init];
    int diag1 = 0;
    int diag2 = 0;
    
    
    for (NSString *tmpString in array) {
        [_myArray1 addObject:[tmpString componentsSeparatedByString:@" "]];
    }
    for (int i=0; i<[_myArray1 count]; i++) {
        for (int j=0; j<[_myArray1[i] count]; j++) {
            if (i==j) {
                diag1+=[[_myArray1[i] objectAtIndex:j] integerValue];
                
            };
            if (i == [_myArray1 count]-j-1) {
                diag2+=[[_myArray1[i] objectAtIndex:j] integerValue];
            }
        }
    }
    
    
    
    
    NSNumber *result = [[NSNumber alloc] initWithInt:abs(diag1-diag2)];
    return result;
}

@end
