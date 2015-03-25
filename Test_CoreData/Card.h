//
//  Card.h
//  Test_CoreData
//
//  Created by Eduardo Flores on 3/25/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Card : NSManagedObject

@property (nonatomic, retain) NSString * card_id;
@property (nonatomic, retain) NSString * card_type;
@property (nonatomic, retain) NSString * card_name;
@property (nonatomic, retain) NSString * card_issuer;

@end
