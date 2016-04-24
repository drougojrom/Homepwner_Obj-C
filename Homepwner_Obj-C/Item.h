//
//  Item.h
//  RandomItemsMac
//
//  Created by Roman Ustiantcev on 18/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

// replaced with @property
//{
//    NSString *_itemName;
//    NSString *_serialNumber;
//    int _valueInDollars;
//    NSDate *_dateCreated;
//
//    Item *_containedItem;
//    __weak Item *_container;
//    
//}

// class method
+(instancetype)randomItem;

// Silver

-(instancetype)initWithName:(NSString *)name
               serialNumber:(NSString *)serNum;

// Designed init for Item
- (instancetype)initWithItemName:(NSString *)name
                 valueInDollars:(int)value
                   serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

// setters and getters ---- ---- ----- replaced with @property
//-(void)setContainedItem:(Item *)item;
//-(Item *)item;
//
//-(void)setContainer:(Item *)item;
//-(Item *)container;
//
//-(void)setItemName:(NSString *)str;
//-(NSString *)itemName;
//
//-(void)setSerialNumber:(NSString *)str;
//-(NSString *)serialNumber;
//
//-(void)setValueInDollars:(int)v;
//-(int)valueInDollars;
//
//-(NSDate *)dateCreated;

@end
