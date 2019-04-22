#import "ViewController.h"
#import "Parser.h"
@interface ViewController ()
@property (nonatomic, retain) UITextField * textField;
@property(nonatomic, retain) UIImageView *imageViewCountry;
@end

@implementation ViewController

- (void)viewDidLoad {
    self.textField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 100, 350, 40)] autorelease];
    self.textField.delegate = self;
    self.textField.keyboardType = UIKeyboardTypePhonePad;
    self.textField.backgroundColor = [UIColor redColor];
    
    self.imageViewCountry = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 40, 40)] autorelease];
    self.textField.leftView = self.imageViewCountry;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.leftView.backgroundColor = [UIColor  greenColor];
    
    [self.view addSubview: self.textField];
    [super viewDidLoad];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
   
    NSString * stringTextfield = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSString *number = [[stringTextfield componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
    if(stringTextfield.length == 1) {
        if([stringTextfield isEqualToString:@"+"]) {
            return YES;
        }
    }
    if(stringTextfield.length ==0) {
        textField.text = @"";
        return NO;
    }
    if(range.length > 0 && [[stringTextfield substringFromIndex:stringTextfield.length - 1] isEqualToString:@")"]) {
        textField.text = [stringTextfield substringToIndex:stringTextfield.length - 2];
        return NO;
    }
    PhoneNumber *phoneNumber = [Parser parsePhoneNumaber:stringTextfield];
    if(number.length > 12 || (phoneNumber.stringPrefix && (((int)number.length - (int)phoneNumber.stringPrefix.length) > (int)phoneNumber.phoneNumberLength))) {
        return NO;
    }
    if(![self isDecimal:string]) {
        return NO;
    }
    textField.text = phoneNumber.outputString;
    if([number isEqualToString:@"7"]) {
        self.imageViewCountry.image = nil;
        return NO;
    }
    else if([number hasPrefix:@"77"]) {
        [self imageCountry:@"77"];
        return NO;
    }
    else {
        if(phoneNumber.stringPrefix) {
            [self imageCountry:phoneNumber.stringPrefix];
        }
        else {
            self.imageViewCountry.image = nil;
        }
    }
    return NO;
    
    
    
   // NSString* pattern8 = @"^\\+[0-9]{2,3}\\s\\([0-9]{2}+\\)\\s[0-9]{3}+\\s[0-9]{3}+$";
    
}


- (BOOL)isDecimal: (NSString*) string {
    NSNumberFormatter *nf = [[[NSNumberFormatter alloc] init] autorelease];
    BOOL isDecimal = [nf numberFromString:string] != nil;
    return isDecimal;
}

- (void) imageCountry: (NSString *) countryPrefix{
    NSDictionary * dictionaryCountrePrefix = [[[NSDictionary alloc] initWithDictionary: [ViewController prefixCountry]]autorelease];
    if ([countryPrefix hasPrefix:@"7"]) {
        if ([countryPrefix hasPrefix:@"77"]) {
            [self.imageViewCountry setImage:[UIImage imageNamed: [@"flag_" stringByAppendingString:[dictionaryCountrePrefix valueForKey:@"7"][1]]]];
        } else  {
       
         [self.imageViewCountry setImage:[UIImage imageNamed: [@"flag_" stringByAppendingString:[dictionaryCountrePrefix valueForKey:@"7"][0]]]];
    }
    }   else {
        [self.imageViewCountry setImage:[UIImage imageNamed: [@"flag_" stringByAppendingString:[dictionaryCountrePrefix valueForKey:countryPrefix]]]];
    }
}

+ (NSDictionary *)prefixCountry {
    return @{@"7": @[@"RU", @"KZ"],
             @"373": @"MD",
             @"374": @"AM",
             @"375": @"BY",
             @"380": @"UA",
             @"992": @"TJ",
             @"993": @"TM",
             @"994": @"AZ",
             @"996": @"KG",
             @"998": @"UZ"
             };
}

-(void) dealloc {
    [_textField dealloc];
    [_imageViewCountry dealloc];
    [super dealloc];
}

@end
