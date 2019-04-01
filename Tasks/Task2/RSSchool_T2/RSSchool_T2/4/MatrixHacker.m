#import "MatrixHacker.h"
/*
 You need to implement a method injectCode: which would take a block and peersist it.
 Later, when runCodeWithData: is called, the class should apply the saved block to each
 element of the array, creating either a character with the same name either a clone
 named "Agent Smith". If the name is not "Neo", the clone of "Agent Smith" is created.
 
 - Example:
 Input: ["Jane Doe", "Delivery Guy", "Postman", "Neo", "Agent John", "Dog"]
 Output: [Character(name: "Agent Smith", isClone: true),
 Character(name: "Agent Smith", isClone: true),
 Character(name: "Agent Smith", isClone: true),
 Character(name: "Neo", isClone: false),
 Character(name: "Agent Smith", isClone: true),
 Character(name: "Agent Smith", isClone: true)]
 */
@interface MatrixHacker ()
// your code here
@property(nonatomic,copy)id<Character> (^myBlock)(NSString*);
@end


@implementation MatrixHacker
// your code here
- (void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    _myBlock =theBlock;
}


- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    NSMutableArray *returnedArray = [[[NSMutableArray alloc] init] autorelease];
    for (NSString* name in names) {
        if (_myBlock) {
            id<Character> character = _myBlock(name);
            [returnedArray addObject:character];
        }
    }
    return returnedArray;
}

-(void)dealloc {
    [_myBlock release];
    [super dealloc];
}

@end
