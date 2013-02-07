//
//  ViewController.m
//  iDecide
//
//  Created by Eric Chiang on 1/22/13.
//  Copyright (c) 2013 Eric Chiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int num = 1;

@synthesize decisionText=decisionText_;

-(IBAction)buttonPressed:(id)sender
{
    decisionText_.text = @"Go for it!";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
