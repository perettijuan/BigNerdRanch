//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Juan Pablo Peretti on 17/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRChangeItemDateViewController.h"
#import "BNRImageStore.h"

@interface BNRDetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation BNRDetailViewController




-(void) viewDidLoad
{
    [super viewDidLoad];
    
    UIToolbar *numberToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelValueEnter)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneValueEnter)],
                           nil];
    [numberToolbar sizeToFit];
    self.valueField.inputAccessoryView = numberToolbar;
}


/*
 * Method called just before than the ViewController shows its view.
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *imageKey = self.item.itemKey;
    // Get the image from the store if possible
    UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:imageKey];
    self.imageView.image = imageToDisplay;
    
  }

-(void) cancelValueEnter
{
    [self.valueField resignFirstResponder];
    self.valueField.text = [NSString stringWithFormat:@"%d", _item.valueInDollars];
}

-(void) doneValueEnter
{
    BNRItem *item = self.item;
    item.valueInDollars = [self.valueField.text intValue];
    [self.valueField resignFirstResponder];

}


/*
 * Method called (this time by the UINavigationController) called when this ViewController
 * is about to be popped from the stack
 */
-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // clear first the responder
    /*
     “Notice the use of endEditing:. When the message endEditing: is sent to a view, if it or any of its subviews is currently the first responder, 
     it will resign its first responder status, and the keyboard will be dismissed. (The argument passed determines whether the first responder 
     should be forced into retirement. Some first responders might refuse to resign, and passing YES ignores that refusal.)”
     
     Fragmento de: Conway, Joe. “iOS Programming: The Big Nerd Ranch Guide (4th Edition) (Big Nerd Ranch Guides)”. iBooks.
     */
    [self.view endEditing:YES];
    
    // Save changes to the item
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}


-(void) setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}



/*
 * Delegate implementation of UIImagePickerControllerDelegate to handle the return from the camera
 */
-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Get picked image from the info dictionary
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    // Store the image in the store
    [[BNRImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    
    self.imageView.image = image;
    // Take the image picker off the screen
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


/**
 * Implement the delegate from UITextFieldDelegate to dismiss the keyboard
 */
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


/**
 * Will respond to a touch in the view (window)
 */
- (IBAction)backgroundTapped:(id)sender
{
    [self.view endEditing:YES];
}

-(IBAction)changeItemDate:(id)sender
{
    BNRChangeItemDateViewController *changeDateVC = [[BNRChangeItemDateViewController alloc] init];
    changeDateVC.item = self.item;
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:changeDateVC animated:YES];

    
}

- (IBAction)takePicture:(id)sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    // if the devices has a camera, take a picture. Otherwise, just pick from photo library
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    
    // Place image picker on the screen
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}
- (IBAction)removePicture:(id)sender {
    
    NSString *itemKey = _item.itemKey;
    [[BNRImageStore sharedStore] deleteImageForKey:itemKey];
    self.imageView.image = nil;
}



@end
