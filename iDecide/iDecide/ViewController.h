//
//  ViewController.h
//  iDecide
//
//  Created by Eric Chiang on 1/22/13.
//  Copyright (c) 2013 Eric Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UILabel *decisionText_;
}
@property (retain, nonatomic) IBOutlet UILabel *decisionText;

-(IBAction)buttonPressed:(id)sender;


@end
