#import "ArrayPrint.h"
/*
 You need to extend NSArray functionality and add a method which will print it's contents.
 It should also print square brackets for the beginning and the end of the array.
 
 - Example
 Input: @[@[@0, @1, @2], [NSNull null], @[@"123",@"456",@"789"], @[@[@[@1337], @{@"Key": @"Value"}]]]
 Output: [[0,1,2],null,["123","456","789"],[[[1337],unsupported]]]
 
 Following element types should be supported:
 NSNumber
 NSNull
 NSArray
 NSString
 
 For all the others, it should print `unsupported`
 */

@implementation NSArray (RSSchool_Extension_Name)

- (NSString *)print {
    NSMutableString * stringResult = [[NSMutableString alloc] init];
    [stringResult appendString:@"["];
    for (int i=0; i<[self count]; i++) {
        if ( [[[self objectAtIndex:i] class] isSubclassOfClass:[NSArray class]]) {
            [stringResult appendString: [[self objectAtIndex:i] print]];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
        } else if ([[[self objectAtIndex:i] class] isSubclassOfClass:[NSNumber class]]) {
            [stringResult appendFormat:@"%@", [self objectAtIndex:i]];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
            NSLog(@"%@",stringResult);
        } else if ([[[self objectAtIndex:i] class] isSubclassOfClass:[NSNull class]]) {
            [stringResult appendString: @"null"];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
            
        }else if ([[[self objectAtIndex:i] class] isSubclassOfClass:[NSString class]]) {
            [stringResult appendFormat:@"\"%@\"", [self objectAtIndex:i]];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
        } else {
            [stringResult appendString: @"unsupported"];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
        }
    }
    [stringResult appendString:@"]"];
    return stringResult;
}

- (u_long ) indexCount {
    return [self count]-1;
}
@end
