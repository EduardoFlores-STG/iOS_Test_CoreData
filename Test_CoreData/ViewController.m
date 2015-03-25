//
//  ViewController.m
//  Test_CoreData
//
//  Created by Eduardo Flores on 3/25/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // Singleton approach
    // self.managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
}

- (void) saveManagedObjectContext
{
    NSError *error = nil;
    if ( ![self.managedObjectContext save:&error])
    {
        NSLog(@"Error saving context. Error = %@", error);
    }
    else
    {
        NSLog(@"Saved managedObjectContext!");
    }
}

- (NSArray *) fetchForEntityName:(NSString *)entityName
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    return [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

- (void) generateCard
{
    // First Course object
    Card *card = (Card *) [NSEntityDescription insertNewObjectForEntityForName:@"Card" inManagedObjectContext:[self managedObjectContext]];
    card.card_name = @"Eduardo Flores";
    card.card_issuer = @"HOA";
    card.card_type = @"Rec Center";
    card.card_id = [NSString stringWithFormat:@"%@", [NSDate date]];    // to get something new every time for now
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button_save:(id)sender
{
    [self generateCard];
    [self saveManagedObjectContext];
}

- (IBAction)button_fetch:(id)sender
{
    NSArray *fetchedObjects = [self fetchForEntityName:@"Card"];
    NSLog(@"fetchedObjects = %@", fetchedObjects);
}

- (IBAction)button_delete:(id)sender
{
    // delete the last card. Assuming there are objects to delete
    NSArray *fetchedObjects = [self fetchForEntityName:@"Card"];
    NSLog(@"number of objects before delete = %lu", (unsigned long)[fetchedObjects count]);
    
    Card *lastCard = [fetchedObjects lastObject];
    [self.managedObjectContext deleteObject:lastCard];
    [self saveManagedObjectContext];
    
    fetchedObjects = [self fetchForEntityName:@"Card"];
    NSLog(@"number of objects after delete = %lu", (unsigned long)[fetchedObjects count]);
}
@end



















