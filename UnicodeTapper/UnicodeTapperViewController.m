//
//  UnicodeTapperViewController.m
//  UnicodeTapper
//
//  Created by Bill Agee on 7/28/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "UnicodeTapperViewController.h"

@interface UnicodeTapperViewController ()

@end

@implementation UnicodeTapperViewController
@synthesize topBarLabel;
@synthesize bigCharLabel;
@synthesize currentCodePoint = _currentCodePoint;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Starting code point
    if (! _currentCodePoint) {
        _currentCodePoint = 0x20;
    }
    
    // If device supports it, set accessibility identifiers for the UILabels
    // in order to find them in UIAutomation easily.  Note that the
    // accessibilityIdentifier can't be set in IB yet, as of Xcode 4.3.3;
    // also, it's only supported in iOS 5 and up.
    topBarLabel.isAccessibilityElement = YES;
    bigCharLabel.isAccessibilityElement = YES;
    if ([topBarLabel respondsToSelector:@selector(accessibilityIdentifier)]) {
        topBarLabel.accessibilityIdentifier = @"topBarLabel";
        bigCharLabel.accessibilityIdentifier = @"bigCharLabel";
    } else {
        topBarLabel.accessibilityLabel = @"topBarLabel";
        bigCharLabel.accessibilityLabel = @"bigCharLabel";        
    }

    // Display starting code point to user
    [self displayNextCharacter:self];
}

- (void)viewDidUnload
{
    [self setTopBarLabel:nil];
    [self setBigCharLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [topBarLabel release];
    [bigCharLabel release];
    [super dealloc];
}

- (IBAction)displayNextCharacter:(id)sender {
    // increment code point
    _currentCodePoint++;
    
    // Format the code point as a string so we can
    // display it in the view:
    NSString *codePointString = [NSString stringWithFormat:@"%C", _currentCodePoint];
    
    // Show the code point in the main viewer
    self.bigCharLabel.text = codePointString;
    // Have to set this to expose the value to UIAutomation:
    self.bigCharLabel.accessibilityValue = codePointString;
    
    // Display the code point's number in the top bar
    NSString *topBarString = [NSString stringWithFormat:@"Unicode code point: U+%04x", _currentCodePoint];
    self.topBarLabel.text = topBarString;
    self.topBarLabel.accessibilityValue = topBarString;
}
@end
