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
            NSLog(@"Catch array");
            [stringResult appendString: [[self objectAtIndex:i] print]];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
        } else if ([[[self objectAtIndex:i] class] isSubclassOfClass:[NSNumber class]]) {
            NSLog(@"Catch number");
            [stringResult appendFormat:@"%@", [self objectAtIndex:i]];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
            NSLog(@"%@",stringResult);
        } else if ([[[self objectAtIndex:i] class] isSubclassOfClass:[NSNull class]]) {
            NSLog(@"Catch null");
            [stringResult appendString: @"null"];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
            
        }else if ([[[self objectAtIndex:i] class] isSubclassOfClass:[NSString class]]) {
            NSLog(@"Catch string");
            [stringResult appendFormat:@"\"%@\"", [self objectAtIndex:i]];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
            NSLog(@"%@",stringResult);
        } else {
            NSLog(@"Catch unsupported");
            [stringResult appendString: @"unsupported"];
            if (i!=[self indexCount]) {
                [stringResult appendString:@","];
            }
        }
    }
    [stringResult appendString:@"]"];
    NSLog(@"%@", stringResult);
    return stringResult;
}

- (u_long ) indexCount {
    return [self count]-1;
}
@end
