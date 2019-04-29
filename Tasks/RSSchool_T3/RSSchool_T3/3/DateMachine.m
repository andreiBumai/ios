#import "DateMachine.h"

@implementation DateMachine
- (void)viewDidLoad {
  [super viewDidLoad];
  // have fun
    
    UITextField *stepTextField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 300, 400,20)] autorelease];
    stepTextField.placeholder = @"Step";
    stepTextField.delegate = self;
    stepTextField.keyboardType = UIKeyboardTypeNumberPad;
    stepTextField.tag = 1;
    [self.view addSubview:stepTextField];
    
    UITextField *dateUnitTextField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 400, 400,20)] autorelease];
    dateUnitTextField.placeholder = @"Date unit";
    dateUnitTextField.delegate = self;
    dateUnitTextField.tag =2;
    [self.view addSubview:dateUnitTextField];
    
    UITextField *starDateTextField = [[[UITextField alloc] initWithFrame:CGRectMake(20, 500, 400,20)]autorelease];
    starDateTextField.placeholder = @"Start date";
    starDateTextField.delegate = self;
    starDateTextField.tag =3;
    [starDateTextField addTarget:self action:@selector(changed:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:starDateTextField];
    
    UIButton *addButton = [[[UIButton alloc] initWithFrame:CGRectMake(20, 600, 100, 20)] autorelease];
    [addButton setTitle:@"Add" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonAction:) forControlEvents:UIControlEventTouchDown];
    addButton.tag =4;
    [self.view addSubview: addButton];
    
    UIButton *subButton = [[[UIButton alloc] initWithFrame:CGRectMake(120, 600, 100, 20)] autorelease];
    [subButton setTitle:@"Sub" forState:UIControlStateNormal];
    [subButton addTarget:self action:@selector(subButtonAction:) forControlEvents:UIControlEventTouchDown];
    subButton.tag = 5;
    [self.view addSubview: subButton];
    
    UILabel *outputLabel = [[[UILabel alloc] initWithFrame:CGRectMake(20, 700, 400, 20)] autorelease];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd/MM/yyyy HH:mm";
    outputLabel.text = [formatter stringFromDate:[NSDate date]];
    outputLabel.tag =6;
    [self.view addSubview:outputLabel];
}

- (void) changed: (UITextField*) textField {
    UILabel * label = [self.view viewWithTag:6];
    if( textField.tag == 3) {
        label.text = textField.text;
    }
    
}


-(void)addButtonAction:(id) sender {
    UILabel * label = [self.view viewWithTag:6];
    UITextField *textfieldStep = [self.view viewWithTag:1];
    UITextField *textFieldUnit = [self.view viewWithTag:2];
    NSDateFormatter * formatter =[[[NSDateFormatter   alloc] init] autorelease];
    formatter.dateFormat = @"dd/MM/yyyy HH:mm";
    NSDate *date = [formatter dateFromString:label.text];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if([textFieldUnit.text isEqualToString: @"year"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitYear
                                               value:[textfieldStep.text integerValue]
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"day"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitDay
                                               value:[textfieldStep.text integerValue]
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"month"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitMonth
                                               value:[textfieldStep.text integerValue]
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"minute"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitMinute
                                               value:[textfieldStep.text integerValue]
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"hour"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitHour
                                               value:[textfieldStep.text integerValue]
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    
    
}

-(void)subButtonAction:(id) sender {
    UILabel * label = [self.view viewWithTag:6];
    UITextField *textfieldStep = [self.view viewWithTag:1];
    UITextField *textFieldUnit = [self.view viewWithTag:2];
    NSDateFormatter * formatter =[[[NSDateFormatter   alloc] init] autorelease];
    formatter.dateFormat = @"dd/MM/yyyy HH:mm";
    NSDate *date = [formatter dateFromString:label.text];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if([textFieldUnit.text isEqualToString: @"year"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitYear
                                               value:(-[textfieldStep.text integerValue])
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"day"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitDay
                                               value:(-[textfieldStep.text integerValue])
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"month"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitMonth
                                               value:(-[textfieldStep.text integerValue])
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"minute"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitMinute
                                               value:(-[textfieldStep.text integerValue])
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"hour"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitHour
                                               value:(-[textfieldStep.text integerValue])
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
    else if([textFieldUnit.text isEqualToString: @"week"]) {
        NSDate *dateNewValue = [calendar dateByAddingUnit:NSCalendarUnitWeekOfMonth
                                               value:(-[textfieldStep.text integerValue])
                                              toDate:date
                                             options:0];
        label.text = [formatter stringFromDate:dateNewValue];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    const char * _char = [string cStringUsingEncoding:NSUTF8StringEncoding];
    int backSpace = strcmp(_char, "\b");
    
    if (textField.tag == 3) {
        return YES;
    }
    if (([@"0123456789" containsString: string] && textField.tag == 1 )|| backSpace == -8 )  {
        return YES;
    }
    if (([@"yearmonthdayhourminuteweek" containsString:string] && textField.tag == 2) ||  backSpace == -8 ) {
        return YES;
    }
    
    
    
    
    return NO;
}



 - (BOOL)textFieldShouldReturn:(UITextField *)textField {
 return YES;
 }
// called when 'return' key pressed. return NO to ignore.
@end
