//
//  ItemStore.h
//  Homepwner_Obj-C
//
//  Created by Roman Ustiantcev on 28/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

// class method
+(instancetype)sharedStore;
-(Item *)createItem;
@end
