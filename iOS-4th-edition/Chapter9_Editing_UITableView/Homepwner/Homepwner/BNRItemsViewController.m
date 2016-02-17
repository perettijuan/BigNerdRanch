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


@property (nonatomic,strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController


// Designated initializer
- (instancetype) init
{
    // call superclass designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    return self;
}


- (instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}


-(void) viewDidLoad
{
    [super viewDidLoad];
    
    // now register the view type that is going to be instantiate when re-using cells
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}


-(UIView *) headerView
{
    if(!_headerView) {
        // load HeaderView.xib file
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
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


/*
 * Method defined by the protocol of UITableViewDataSource that is calld when a delete (for an Item)
 * call is detected
 */
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        //Means that the table is asking to commit a delete command
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        
        [[BNRItemStore sharedStore]removeItem:item];
        
        // also remove that row from the table
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/*
 * Method defined by the protocol of UITableViewDataSource that is calld when the table notifies
 * the datasource that is moving an item from a position to the new position
 */
-(void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}


-(IBAction)addNewItem:(id)sender
{
    
    // create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    
    // Figure out where that item is in the array
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    //Insert the new row
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
}


-(IBAction)toggleEditingMode:(id)sender
{
    if(self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

@end
