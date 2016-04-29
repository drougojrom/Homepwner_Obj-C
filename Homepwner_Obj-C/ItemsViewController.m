//
//  ItemsViewController.m
//  Homepwner_Obj-C
//
//  Created by Roman Ustiantcev on 25/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemStore.h"
#import "Item.h"

@implementation ItemsViewController

-(instancetype)init
{
    // call the superclass of designed init
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        for (int i = 0;i<5;i++){
            [[ItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ItemStore sharedStore] allItems] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    // reused cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath: indexPath];
    
    NSArray *items = [[ItemStore sharedStore] allItems];
    Item *item  = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

@end
