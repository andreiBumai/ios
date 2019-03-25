#import "SummArray.h"
@implementation SummArray

// Complete the summArray function below.
- (NSNumber *)summArray:(NSArray *)array {
    NSMutableArray *tempArray  = [[NSMutableArray alloc]initWithArray:array];
    double sum =0;
    for (NSNumber *numberInArray in tempArray) {
        
        sum+=[numberInArray doubleValue];
        
    }
    
    NSNumber * sumNumber = [[NSNumber alloc]initWithDouble:sum];
    return sumNumber;
    
}

@end
