/*
 File: MainViewController.h
 Abstract: Responsible for all UI interactions with the user and the accelerometer
 Version: 2.5
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2010 Apple Inc. All Rights Reserved.
 
 */

#import <UIKit/UIKit.h>

@class GraphView;
@class AccelerometerFilter;

@interface MainViewController : UIViewController<UIAccelerometerDelegate>
{
    
	GraphView *unfiltered;
	GraphView *filtered;
	UIBarButtonItem *pause;
	UILabel *filterLabel;
	AccelerometerFilter *filter;
	BOOL isPaused, useAdaptive, isTouched;
    float maxZ;
    UILabel *minX_label;
    UILabel *minY_label;
    UILabel *minZ_label;
    UILabel *maxX_label;
    UILabel *maxY_label;
    UILabel *maxZ_label;
    UILabel *test_label;
    
    IBOutlet UIScrollView *scrollView;
    
}

@property (nonatomic, retain) UIScrollView *scrollView;

@property(nonatomic, retain) IBOutlet GraphView *unfiltered;
@property(nonatomic, retain) IBOutlet GraphView *filtered;
@property(nonatomic, retain) IBOutlet UIBarButtonItem *pause;
@property(nonatomic, retain) IBOutlet UILabel *filterLabel;
@property (retain, nonatomic) IBOutlet UILabel *minX_label;
@property (retain, nonatomic) IBOutlet UILabel *minY_label;
@property (retain, nonatomic) IBOutlet UILabel *minZ_label;
@property (retain, nonatomic) IBOutlet UILabel *maxX_label;
@property (retain, nonatomic) IBOutlet UILabel *maxY_label;
@property (retain, nonatomic) IBOutlet UILabel *maxZ_label;
@property (retain, nonatomic) IBOutlet UILabel *test_label;

-(IBAction)pauseOrResume:(id)sender;
-(IBAction)clearPressed:(id)sender;
<<<<<<< HEAD
-(IBAction)switchView:(id)sender;

=======
-(IBAction)SwitchView:(id)sender;
>>>>>>> bd5374b930ff5d6f00af6d0bd3c3a7cd3d0287f6

//-(IBAction)filterSelect:(id)sender;
//-(IBAction)adaptiveSelect:(id)sender;

@end