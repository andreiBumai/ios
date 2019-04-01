#import "RomanTranslator.h"

@implementation RomanTranslator

/**
 Arabic to roman numbers converter
 
 @param arabicString a regular (arabic) number string
 @return a roman representation
 */
- (NSString *)romanFromArabic:(NSString *)arabicString {

    
    NSString* (^blockName)(NSString* ,NSString*,NSString*, int ) = ^(NSString* obj1,NSString* obj2,NSString* obj3,int value) {

        NSMutableString * blockInResultString = [[[NSMutableString alloc] initWithString:@""] autorelease];
        switch (value) {
            case 0:
                 //0
                break;
            case 4:
                [blockInResultString appendFormat:@"%@%@", obj1,obj2]; //IX
                break;
            case 5:
                [blockInResultString appendFormat:@"%@", obj2];         //V
                break;
            case 9:
                [blockInResultString appendFormat:@"%@%@", obj1,obj3];  //IX
                break;
            default:
                if (value<4) {
                    for (int i=0; i<value; i++) {
                        [blockInResultString appendString:obj1];    //III
                    }
                } else {
                    [blockInResultString appendFormat:@"%@", obj2];
                    for (int i=5; i<value; i++) {
                        [blockInResultString appendString:obj1];    //VIII
                    }
                }
                break;
        }
        return blockInResultString;
    }; 
    
      NSMutableString * resultString = [[[NSMutableString alloc] initWithString:@""] autorelease];
   
    for (int i=0; i<[arabicString length]; i++) {
   
        int j =(int)[arabicString length]-i-1;
        int res = (int)[[arabicString substringWithRange:NSMakeRange(j, 1)] integerValue];
        
        if ((int)[arabicString length]==4) {j=j+0;};
        if ((int)[arabicString length]==3) {j=j+1;};
        if ((int)[arabicString length]==2) {j=j+2;};
        if ((int)[arabicString length]==1) {j=j+3;};
        
        switch (j) {
            case 3:
                [resultString appendFormat:@"%@", [[blockName(@"I",@"V",@"X", res) copy]autorelease]];
                break;
            case 2:
                [resultString replaceCharactersInRange:NSMakeRange(0, 0) withString:[[blockName(@"X",@"L",@"C", res) copy] autorelease]];
                break;
            case 1:
                 [resultString replaceCharactersInRange:NSMakeRange(0, 0) withString:[[blockName(@"C",@"D",@"M", res) copy] autorelease]];
                break;
            case 0:
                 [resultString replaceCharactersInRange:NSMakeRange(0, 0) withString:[[blockName(@"M",@"M",@"M", res) copy] autorelease]];
                break;
                
            default:
                break;
               
        }
        
    }
     return resultString;
}



/**
 Roman to arabic numbers converter
 
 @param romanString a roman number string
 @return an arabic number string
 */
- (NSString *)arabicFromRoman:(NSString *)romanString {
  
     NSDictionary *dictionaryOfArabicCharacters = [[[NSDictionary alloc] initWithObjectsAndKeys:@"1", @"I", @"5", @"V",@"10", @"X",@"50", @"L",@"100", @"C",@"500", @"D",@"1000", @"M",nil] autorelease];
    
    int result =0;
    int old_value=0;
    
    for (int i=1; i<=[romanString length]; i++) {
    
        NSString* characterRoman =[[romanString substringWithRange:NSMakeRange((i-1), 1)] autorelease];
        int value =   (int)[[dictionaryOfArabicCharacters valueForKey:characterRoman] integerValue];
        
        if (value>old_value) {
            result=result+value-2*old_value;
        } else{
            result=result+value;
        }
        
       old_value=value;
    }
    
    NSString *resultString = [[NSString stringWithFormat:@"%i", result] autorelease];

    return resultString;
}





// your code here
@end
