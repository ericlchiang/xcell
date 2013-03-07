//
//  ViewController.h
//  InstaEmail
//
//  Created by Eric Chiang on 1/22/13.
//  Copyright (c) 2013 Eric Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate, MFMailComposeViewControllerDelegate> {
    UIPickerView *emailPicker_;
    NSArray* activities_;
    NSArray* feelings_;
    UITextField *notesField_;
}

-(IBAction)sendButtonTapped:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;

@property(nonatomic, retain) IBOutlet UIPickerView *emailPicker;

@property(nonatomic, retain) IBOutlet UITextField *notesField;

@end
