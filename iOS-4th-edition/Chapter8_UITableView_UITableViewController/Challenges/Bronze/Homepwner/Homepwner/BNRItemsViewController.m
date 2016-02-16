//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Juan Pablo Peretti on 10/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController()
@property (nonatomic) NSMutableDictionary *privateItems;
@property (nonatomic) long itemCount;
@end

@implementation BNRItemsViewController

// Private constants to access values in the map
static const NSString *ITEMS_MORE_THAN_50_KEY = @"more_than_50_key";
static const NSString *ITEMS_LESS_THAN_50_KEY = @"less_than_50_key";


// Designated initializer
- (instancetype) init
{
    // call superclass designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        for(int i = 0; i < 55; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
       
        if(_privateItems == nil) {
            _privateItems = [[NSMutableDictionary alloc] init];
            
            
            NSArray *allItems = [[BNRItemStore sharedStore] allItems];
            NSMutableArray *itemsMoreThan50 = [[NSMutableArray alloc] init];
            NSMutableArray *itemsLessThan50 = [[NSMutableArray alloc] init];
            
            for(BNRItem *item in allItems) {
                if([item valueInDollars] > 50) {
                    [itemsMoreThan50 addObject:item];
                } else {
                    [itemsLessThan50 addObject:item];
                }
            }
            
            NSLog(@"More than 50 size %lu", [itemsMoreThan50 count]);
            NSLog(@"Less than 50 size %lu", [itemsLessThan50 count]);
            
            _itemCount = [itemsLessThan50 count] + [itemsMoreThan50 count];
            
            NSLog(@"Size: %lu", _itemCount);
            
            [_privateItems setObject:itemsLessThan50 forKey:ITEMS_LESS_THAN_50_KEY];
            [_privateItems setObject:itemsMoreThan50 forKey:ITEMS_MORE_THAN_50_KEY];
        }
    }
    return self;
}


- (instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


-(void) viewdidLoad
{
    [super viewDidLoad];
    
    // now register the view type that is going to be instantiate when re-using cells
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


/*
 * Method defined by the protocol to determinate the number of rows to show
 */
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}



/*
 * Method defined by the protocol to determinate the text of each section
 */
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0) {
        return @"More than 50";
    } else if(section == 1) {
        return @"Less than 50";
    } else {
        // Should never happen
        return @"Undefined";
    }
}


/*
 * Method defined by the protocol to determinate the text of each section's footer (silver challenge)
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if(section == 0) {
        return @"";
    } else {
        return @"No more Items!";
    }
}

/*
 * Requited by the protocol provided by UITableViewDataSource
 */
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    if(section == 0) {
        count = [[_privateItems objectForKey:ITEMS_MORE_THAN_50_KEY] count];
    } else if(section == 1) {
        count = [[_privateItems objectForKey:ITEMS_LESS_THAN_50_KEY] count];
    }

    return count;
}

/*
 * Method defined by the protocol of UITableViewDataSource for linking each cell
 * of the table with the data that should be shown
 */
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // The UITableViewCell is the View that shows as the cell. Each object of this type has three attrs:
    // textLabel: the leading text
    // detailTextLabel: the trailing label
    // imageView: the icon that can be shown
    
    // UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    // The correct way to do it is this, because we reuse view cells
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    [cell setBackgroundColor:[UIColor whiteColor]];
    
    BNRItemStore *item;
    
    if(indexPath.section == 0) {
        NSLog(@"More than 50 has %lu and is asking for %lu", [[_privateItems objectForKey:ITEMS_MORE_THAN_50_KEY] count], indexPath.row);
        item = [[_privateItems objectForKey:ITEMS_MORE_THAN_50_KEY] objectAtIndex:indexPath.row];
    } else {
        NSLog(@"Less than 50 has %lu and is asking for %lu", [[_privateItems objectForKey:ITEMS_LESS_THAN_50_KEY] count], indexPath.row);
        item = [[_privateItems objectForKey:ITEMS_LESS_THAN_50_KEY] objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.text = [item description];
    
    return cell;
}


@end
