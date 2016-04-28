//
//  ItemStore.m
//  Homepwner_Obj-C
//
//  Created by Roman Ustiantcev on 28/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"

@interface ItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation ItemStore

+(instancetype)sharedStore
{
    static ItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype)init
{
    @throw [NSException exceptionWithName:@"Singletom" reason:@"Use +[ItemStore sharedStore]" userInfo:nil];
    return nil;
}

-(instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSArray *)allItems
{
    return self.privateItems;
}

-(Item *)createItem
{
    Item *item = [Item randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

@end
