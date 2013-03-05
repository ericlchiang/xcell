/*
 File: MainViewController.m
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

#import "MainViewController.h"
#import "GraphView.h"
#import "AccelerometerFilter.h"



#define kUpdateFrequency	1000.0
#define kLocalizedPause		NSLocalizedString(@"Pause","pause taking samples")
#define kLocalizedResume	NSLocalizedString(@"Resume","resume taking samples")

@interface MainViewController()

// Sets up a new filter. Since the filter's class matters and not a particular instance
// we just pass in the class and -changeFilter: will setup the proper filter.
-(void)changeFilter:(Class)filterClass;

@end

@implementation MainViewController

@synthesize unfiltered, filtered, pause, filterLabel, minZ_label, scrollView;

// Implement viewDidLoad to do additional setup after loading the view.
-(void)viewDidLoad
{
    //---set the viewable frame of the scroll view---
    scrollView.frame = CGRectMake(0, 0, 320, 460);
    
    //---set the content size of the scroll view---
    [scrollView setContentSize:CGSizeMake(320, 713)];
    
	[super viewDidLoad];
	pause.possibleTitles = [NSSet setWithObjects:kLocalizedPause, kLocalizedResume, nil];
	isPaused = NO;
	useAdaptive = YES;
	[self changeFilter:[LowpassFilter class]];
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0/kUpdateFrequency];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	
	[unfiltered setIsAccessibilityElement:YES];
	[unfiltered setAccessibilityLabel:NSLocalizedString(@"unfilteredGraph", @"")];
    
	[filtered setIsAccessibilityElement:YES];
	[filtered setAccessibilityLabel:NSLocalizedString(@"filteredGraph", @"")];   
//    
//    // The account scrolling area
//    // define the area that is initially visable
//    scrollView.frame = CGRectMake(74, 261, 620, 354);
//    // then define how much they can scroll it
//    [scrollView setContentSize:CGSizeMake(1220, 354)];
}

-(void)viewDidUnload
{
	[super viewDidUnload];
    [scrollView release];
	self.unfiltered = nil;
	self.filtered = nil;
	self.pause = nil;
	self.filterLabel = nil;
	self.minZ_label = nil;
}

-(void)switchView:(id)sender
{
     test_label.text = @"yeak";
    //[window addSubview:viewController.view];

}

//Red: X
//Green: Y
//Blue: Z


// UIAccelerometerDelegate method, called when the device accelerates.
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    //frameCount ++;
    int y = 0;
    if (isTouched){
        
        minX_label.text = [NSString stringWithFormat:@"%g", acceleration.x];
        minY_label.text = [NSString stringWithFormat:@"%g", acceleration.y];
        minZ_label.text = [NSString stringWithFormat:@"%g", acceleration.z];
        maxX_label.text = [NSString stringWithFormat:@"%g", acceleration.x];
        maxY_label.text = [NSString stringWithFormat:@"%g", acceleration.y];
        maxZ_label.text = [NSString stringWithFormat:@"%g", acceleration.z];
        test_label.text = [NSString stringWithFormat:@"%g", acceleration.z];
    }
    
    
	// Update the accelerometer graph view
	if(!isPaused)
	{
<<<<<<< HEAD
        
        NSArray *accel = [filter addAcceleration:acceleration];
        
        
		[filtered addX:filter.x y:filter.y z:filter.z];
        
        NSString *filteredX = [accel objectAtIndex: 0];
        NSString *filteredY = [accel objectAtIndex: 1];
        NSString *filteredZ = [accel objectAtIndex: 2];
=======
        minX_label.text = (acceleration.x < [minX_label.text doubleValue])? [NSString stringWithFormat:@"%g", acceleration.x] : minX_label.text;
        minY_label.text = (acceleration.y < [minY_label.text doubleValue])? [NSString stringWithFormat:@"%g", acceleration.y] : minY_label.text;
        minZ_label.text = (acceleration.z < [minZ_label.text doubleValue])? [NSString stringWithFormat:@"%g", acceleration.z] : minZ_label.text;
>>>>>>> bd5374b930ff5d6f00af6d0bd3c3a7cd3d0287f6
        
        
<<<<<<< HEAD
        minX_label.text = (filteredX.doubleValue < [minX_label.text doubleValue])? filteredX : minX_label.text;
        minY_label.text = (filteredY.doubleValue < [minY_label.text doubleValue])? filteredY : minY_label.text;
        minZ_label.text = (filteredZ.doubleValue < [minZ_label.text doubleValue])? filteredZ : minZ_label.text;
        
        maxX_label.text = (filteredX.doubleValue > [maxX_label.text doubleValue])? filteredX : maxX_label.text;
        maxY_label.text = (filteredY.doubleValue > [maxY_label.text doubleValue])? filteredY : maxY_label.text;
        maxZ_label.text = (filteredZ.doubleValue > [maxZ_label.text doubleValue])? filteredZ : maxZ_label.text;
        
        //        [unfiltered addX:acceleration.x y:acceleration.y z:acceleration.z];
        //        [filtered addX:acceleration.x y:acceleration.y z:acceleration.z];
      
=======
//        [unfiltered addX:acceleration.x y:acceleration.y z:acceleration.z];
//        [filtered addX:acceleration.x y:acceleration.y z:acceleration.z];

        [filter addAcceleration:acceleration];
		[filtered addX:filter.x y:filter.y z:filter.z];
>>>>>>> bd5374b930ff5d6f00af6d0bd3c3a7cd3d0287f6
        
		//[filtered addX:filter.z y:y z:maxZ];
	}
    isTouched = FALSE;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray* t = [[[event allTouches] allObjects] copy];
    if(t.count!= 0)
        isTouched = TRUE;
}

-(void)changeFilter:(Class)filterClass
{
	// Ensure that the new filter class is different from the current one...
	if(filterClass != [filter class])
	{
		// And if it is, release the old one and create a new one.
		[filter release];
		filter = [[filterClass alloc] initWithSampleRate:kUpdateFrequency cutoffFrequency:5.0];
		// Set the adaptive flag
        //		filter.adaptive = useAdaptive;
		// And update the filterLabel with the new filter name.
		filterLabel.text = filter.name;
	}
}

-(IBAction)pauseOrResume:(id)sender
{
	if(isPaused)
	{
		// If we're paused, then resume and set the title to "Pause"
		isPaused = NO;
		pause.title = kLocalizedPause;	}
	else
	{
		// If we are not paused, then pause and set the title to "Resume"
		isPaused = YES;
		pause.title = kLocalizedResume;
	}
	
	// Inform accessibility clients that the pause/resume button has changed.
	UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, nil);
}

-(IBAction)clearPressed:(id)sender
{
    minX_label.text = @"0.0";
    minY_label.text = @"0.0";
    minZ_label.text = @"0.0";
    maxX_label.text = @"0.0";
    maxY_label.text = @"0.0";
    maxZ_label.text = @"0.0";
}
/*d
 -(IBAction)filterSelect:(id)sender
 {
 if([sender selectedSegmentIndex] == 0)
 {
 // Index 0 of the segment selects the lowpass filter
 [self changeFilter:[LowpassFilter class]];
 }
 else
 {
 // Index 1 of the segment selects the highpass filter
 [self changeFilter:[HighpassFilter class]];
 }
 
 // Inform accessibility clients that the filter has changed.
 UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, nil);
 }
 
 -(IBAction)adaptiveSelect:(id)sender
 {
 // Index 1 is to use the adaptive filter, so if selected then set useAdaptive appropriately
 useAdaptive = [sender selectedSegmentIndex] == 1;
 // and update our filter and filterLabel
 filter.adaptive = useAdaptive;
 filterLabel.text = filter.name;
 
 // Inform accessibility clients that the adaptive selection has changed.
 UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, nil);
 }
 */
-(void)dealloc
{
	// clean up everything.
	[unfiltered release];
	[filtered release];
	[filterLabel release];
	[pause release];
	[super dealloc];
}

@end
