//
//  ViewController.h
//  Test_CoreData
//
//  Created by Eduardo Flores on 3/25/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

- (IBAction)button_save:(id)sender;
- (IBAction)button_fetch:(id)sender;
- (IBAction)button_delete:(id)sender;
@end

