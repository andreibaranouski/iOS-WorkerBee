//
//  BeeTestController.h
//  Worker Bee
//
//  Created by Jens Alfke on 10/4/11.
//  Copyright (c) 2011 Couchbase, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BeeTest;

@interface BeeTestController : UIViewController

- (id) initWithTest: (BeeTest*)test;

@property (readonly) BeeTest* test;
@property (weak, readonly) IBOutlet UISwitch* onOffSwitch;
@property (weak, readonly) IBOutlet UILabel* statusLabel;
@property (weak, readonly) IBOutlet UIActivityIndicatorView* activityIndicator;
@property (weak, readonly) IBOutlet UITextView* transcript;

@end
