#import "DateMachine.h"

@implementation DateMachine
- (void)viewDidLoad {
  [super viewDidLoad];
  // have fun
    
    UITextField *stepTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 300, 400,20)];
    stepTextField.placeholder = @"Step";
    stepTextField.delegate = self;
    stepTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:stepTextField];
    
    UITextField *dateUnitTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 400, 400,20)];
    dateUnitTextField.placeholder = @"Date unit";
    dateUnitTextField.delegate = self;
    [self.view addSubview:dateUnitTextField];
    
    UITextField *starDateTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 500, 400,20)];
    starDateTextField.placeholder = @"Start date";
    starDateTextField.delegate = self;
    [self.view addSubview:starDateTextField];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 600, 100, 20)];
    [addButton setTitle:@"Add" forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addButtonAction:) forControlEvents:UIControlEventTouchUpOutside];
    [self.view addSubview: addButton];
    
    UIButton *subButton = [[UIButton alloc] initWithFrame:CGRectMake(120, 600, 100, 20)];
    [subButton setTitle:@"Sub" forState:UIControlStateNormal];
    [subButton addTarget:self action:@selector(subButtonAction:) forControlEvents:UIControlEventTouchUpOutside];
    [self.view addSubview: subButton];
    
    UILabel *outputLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 700, 400, 20)];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd/MM/yyyy HH:mm";
    outputLabel.text = [formatter stringFromDate:[NSDate date]];
    [self.view addSubview:outputLabel];
    
    
    
    
}


-(void)addButtonAction:(id) sender {
    
}

-(void)subButtonAction:(id) sender {
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return YES;
}



 - (BOOL)textFieldShouldReturn:(UITextField *)textField {
 return YES;
 }
// called when 'return' key pressed. return NO to ignore.
@end
