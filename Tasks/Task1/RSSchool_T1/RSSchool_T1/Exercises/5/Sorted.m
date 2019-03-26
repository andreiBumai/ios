#import "Sorted.h"

@implementation ResultObject


@end

@implementation Sorted

// Complete the sorted function below.
- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    
    NSMutableArray * tmpArray = [[NSMutableArray alloc] initWithArray:[string componentsSeparatedByString:@" "]];

    int countMisMatches =0;
    int index1 =0, index2 =0;
    
    int indexBase1=0, indexBase2=0;
    
    for (int i=1; i<[tmpArray count]; i++) {
        
        if ([[tmpArray objectAtIndex:i] integerValue]<[[tmpArray objectAtIndex:(i-1)]integerValue]) {

//            indexBase1=i-1;
//            for (int j=indexBase1; (j+1)<[tmpArray count]; j++) {
//                if ([[tmpArray objectAtIndex:j] integerValue]>[[tmpArray objectAtIndex:(j+1)]integerValue]) {
//                   indexBase2=j+1;
//                }  else {
//                    value.status=YES;
//                    value.detail = [NSString stringWithFormat:@"reverse %d %d", (indexBase1+1) , (indexBase2+1)];
//                    NSLog(@"Range end");}
//            }

            countMisMatches++;
            if (index1==0) {
                index1=i;
            } else {
                index2=i;
            }
        }
    }
    
    
    if (countMisMatches==1) {
        
        if ([ tmpArray count]==2) { //Exception anArray count == 2
        value.status=YES;
        value.detail = [NSString stringWithFormat:@"swap %d %d", index1, (index1+1) ];
        return value;
        }
        value.status=NO;
        value.detail = [NSString stringWithFormat:@"Exception %d %d", index1, (index1+1) ];
        return value;
        
    }
    
    if (countMisMatches==0) {
        value.status = YES;
        value.detail = @"Sorted";
        return value;
    }
    
    
    if (countMisMatches==2) {
        value.status=YES;
        value.detail = [NSString stringWithFormat:@"swap %d %d", index1 , (index2+1) ];
        return value;
    }
    
    if (countMisMatches>2) {
        value.status =NO;
        value.detail = @"No chance";
        return value;
    }
    
  
    
    
    
    
    NSLog(@"...neccesary to finish");
    return value;
}

@end
