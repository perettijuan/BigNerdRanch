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

@implementation BNRItemsViewController


// Designated initializer
- (instancetype) init
{
    // call superclass designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        for(int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
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
 * Requited by the protocol provided by UITableViewDataSource
 */
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
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
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItemStore *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    
    return cell;
}

@end
