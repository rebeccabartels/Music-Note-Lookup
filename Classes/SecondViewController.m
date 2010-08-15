//
//  SecondViewController.m
//  NoteToFreq
//
//  Created by Sam on 8/2/10.
//  Copyright 2010 calamitySoft. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

@synthesize delegate;
@synthesize freqTextField;
@synthesize noteText;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:@"SecondView" bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[freqTextField release];
    [super dealloc];
}

-(IBAction)convertFreqToNote
{
//	double testFrequency = 92.4986;
	NSNumber *dude = [NSNumber alloc];
	NSNumberFormatter *dudette = [[NSNumberFormatter alloc] init];
	[dudette setFormatterBehavior:NSNumberFormatterBehavior10_4];
	dude = [dudette numberFromString:noteText.text];
	NSLog(@"Number post conversion: %@, from text: %s", dude, noteText.text);
	double testFrequency = [dude floatValue];
	NSLog(@"Converting frequency %1.4f Hz to note... %@", testFrequency, [delegate freqToNote:testFrequency]);
	
	[freqTextField resignFirstResponder];
	
	noteText.text = [delegate freqToNote:testFrequency];
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == freqTextField) {
        [freqTextField resignFirstResponder];
    }
    return YES;
}


@end
