//
//  UnicodeTapperViewController.h
//  UnicodeTapper
//
//  Created by Bill Agee on 7/28/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnicodeTapperViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *topBarLabel;
@property (retain, nonatomic) IBOutlet UILabel *bigCharLabel;
- (IBAction)displayNextCharacter:(id)sender;

@property (nonatomic) NSInteger currentCodePoint;

@end
