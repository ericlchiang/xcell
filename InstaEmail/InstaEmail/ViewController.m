//
//  ViewController.m
//  InstaEmail
//
//  Created by Eric Chiang on 1/22/13.
//  Copyright (c) 2013 Eric Chiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize emailPicker=emailPicker_;
@synthesize notesField=notesField_;

-(IBAction)sendButtonTapped:(id)sender{
    
    NSString *message = [NSString stringWithFormat:@" %@!!!, I'm %@, and feeling %@ about it",
                         notesField_.text ? notesField_.text : @"" ,
    [activities_ objectAtIndex:[emailPicker_ selectedRowInComponent:0]],
                        [feelings_ objectAtIndex:[emailPicker_ selectedRowInComponent:1]]];
    
    
    if([MFMailComposeViewController canSendMail]){
        MFMailComposeViewController* mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"Hello Renee!"];
        [mailController setMessageBody:message isHTML:NO];
        [self presentModalViewController:mailController animated:YES];
        
    }
    else {
    
        NSLog(@"%@", @"You haven't set up email yet");
    }
    
    NSLog(@"%@", message );
    
    NSLog(@"%@", notesField_.text );
    
    
}

-(IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    activities_ = [[NSArray alloc] initWithObjects: @"sleeping", @"eating", @"working", @"thinking",  @"eathing",  @"crying",  @"begging",  @"leaving",  @"shopping",  @"hello worlding",  @"sucking",  @"hamburgering", nil ];
    
    feelings_ = [[NSArray alloc] initWithObjects: @"awesome", @"sad", @"happy", @"ambivlaent",  @"nauseous",  @"psyched",  @"confused",  @"stoked",  @"melancholy",  @"anxious",  @"screwed", nil ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark Picker Datasource Protocol
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if( component == 0)
        return [activities_ count];
    else 
        return [feelings_ count];
}


#pragma mark -
#pragma mark Picker Datagate Protocol

-(NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == 0)
        return [activities_ objectAtIndex:row];
    else
        return [feelings_ objectAtIndex:row];
    return nil;
        
}


@end
