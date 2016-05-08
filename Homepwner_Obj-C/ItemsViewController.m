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

@interface ItemsViewController ()

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

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

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 2;
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section == 0){
//        return @"Low cost";
//    } else {
//        return @"High cost";
//    }
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    // reused cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath: indexPath];
    
    NSArray *items = [[ItemStore sharedStore] allItems];
    Item *item  = items[indexPath.row];
    
//    switch ([indexPath section]) {
//        case 0:
//            if (item.valueInDollars < 50) {
//                cell.textLabel.text = [item description];
//            }
//            break;
//            
//        case 1:
//            if (item.valueInDollars > 50) {
//                cell.textLabel.text = [item description];
//            }
//            break;
//    }

    cell.textLabel.text = [item description];
    
    return cell;
}

//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return @"Last Row. No more items in section";
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 44;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 60;
//}

-(IBAction)addNewItem:(id)sender
{

}

-(IBAction)toggleEditingMode:(id)sender
{
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
}

-(UIView *)headerView
{
    if (!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return _headerView;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    // Adding top margin to the header view
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    UIView *header = self.headerView;
    // making the frame for the header view
    header.frame = CGRectMake(0, 0, 400, 57);
    
    [self.tableView setTableHeaderView:header];
}

@end
