//
//  Item.m
//  RandomItemsMac
//
//  Created by Roman Ustiantcev on 18/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "Item.h"

@implementation Item

-(NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

// replaced with @property

//-(void)setItemName:(NSString *)str
//{
//    _itemName = str;
//}
//
//-(NSString *)itemName
//{
//    return _itemName;
//}
//
//-(void)setSerialNumber:(NSString *)str
//{
//    _serialNumber = str;
//}
//
//-(NSString *)serialNumber
//{
//    return _serialNumber;
//}
//
//-(void)setValueInDollars:(int)v
//{
//    _valueInDollars = v;
//}
//
//-(int)valueInDollars
//{
//    return _valueInDollars;
//}
//
//-(NSDate *)dateCreated
//{
//    return _dateCreated;
//}
//
//-(void)setContainerItem:(Item *)item
//{
//    _containedItem = item;
//    item.container = self;
//}
//-(Item *)containedItem
//{
//    return _containedItem;
//}
//
//-(void)setContainer:(Item *)item
//{
//    _container = item;
//}
//-(Item *)container
//{
//    return _container;
//}

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber
{
    // call the superclass
    self = [super init];
    
    // did the superclass designated init succeed?
    if (self) {
        // give the instance vars initial values
        _itemName = name;
        _serialNumber = sNumber;
        _valueInDollars = value;
        // current date and tine
        _dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

-(instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

-(instancetype)init
{
    return [self initWithItemName:@"Item"];
}

+(instancetype)randomItem
{
    // create an immutable array of items - adjectives
    NSArray *randomAdjectivesList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    // create an immutable array of items - nouns
    NSArray *randomNounsList = @[@"Bear", @"Spork", @"Mac"];
    
    // get the index of random items from the lists; not an object, without *
    
    NSInteger adjectivesIndex = arc4random() % [randomAdjectivesList count];
    NSInteger nounsIndex = arc4random() % [randomNounsList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@" , randomAdjectivesList[adjectivesIndex], randomNounsList[nounsIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", '0' + arc4random() % 10,
                                                                            'A' + arc4random() % 26,
                                                                            '0' + arc4random() % 10,
                                                                            'A' + arc4random() % 26,
                                                                            '0' + arc4random() % 10];
    Item *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}

// Silver

-(instancetype)initWithName:(NSString *)name serialNumber:(NSString *)serNum
{
    return [self initWithName:@"SilverItem" serialNumber:@"Ser1AlNum"];
}

-(void)dealloc
{
    NSLog(@"Destroyed %@", self);
}

@end
