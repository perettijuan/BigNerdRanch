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
#import "BNRDetailViewController.h"


@interface BNRItemsViewController()

@end

@implementation BNRItemsViewController


// Designated initializer
- (instancetype) init
{
    // call superclass designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    
    // set the title (just the title for now) to the application top bar
    if(self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwener";
        
        // Create a new bar bittom (to be shown on the right of the top bar) to add a new item
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        navItem.rightBarButtonItem = bbi;
        
        // add a left buttom for edditing the list
        navItem.leftBarButtonItem = self.editButtonItem;
    }
    
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
}



-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
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
    BNRItem *item = [[BNRItemStore sharedStore] createItem];
    
    
    // Figure out where that item is in the array
    //NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    //Insert the new row
    //[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc] initForNewItem:YES];
    detailViewController.item = item;
    
    // create a block (magic) to execute when the popup is dismissed
    detailViewController.dismissBlock = ^{[self.tableView reloadData];};
    
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:navController animated:YES completion:nil];
    
}

/*
 * Method defined by the protocol of UITableViewDataSource that is calld when an item in the list is tapped
 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc] initForNewItem:NO];

    // Give the BNRDetailViewController the item to show
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem = items[indexPath.row];
    detailViewController.item = selectedItem;
    
    // This line simply remove the default text right next to the back buttom
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:self.navigationItem.backBarButtonItem.style target:nil action:nil];

    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
