#import "Encryption.h"
@interface Encryption()
@property (nonatomic, strong) NSString *resulString;
@end

@implementation Encryption

// Complete the encryption function below.
- (NSString *)encryption:(NSString *)string {
  
    _resulString = @"";
    NSString *tmpString = [[NSString alloc] initWithString:string];
    
    [tmpString stringByReplacingCharactersInRange:NSMakeRange(0, [string length]) withString:@" "];
    
        int rows = floor(sqrt([tmpString length]));
        int columns = ceil(sqrt([tmpString length]));
    
    if (rows*columns< [tmpString length]) {
        rows+=1;
    }                                               
    
    for (int i=0; i<columns;i++) {
      
        if (i!=0) {
            _resulString = [_resulString stringByAppendingString:@" "];
        }
        
        for (int j=0; j<rows; j++) {
                if (j*columns+i<[tmpString length]) {
                    int indexChar = j*columns+i;
                    NSString *iCharFromTmpString  = [NSString stringWithFormat:@"%c", [tmpString characterAtIndex:indexChar]];
                    _resulString =  [_resulString stringByAppendingString:iCharFromTmpString];
                }
            }
}
    return _resulString;
}

@end
