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
#import "BNRItemStore.h"

@interface BNRDetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UIPopoverControllerDelegate>
@property (strong, nonatomic) UIPopoverController *imagePickerPopover;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cameraButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *deleteImageButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation BNRDetailViewController



-(instancetype)initForNewItem:(BOOL)isNew
{
    self = [super initWithNibName:nil bundle:nil];
    if(self) {
        if(isNew) {
            UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            self.navigationItem.rightBarButtonItem = doneItem;
            
            UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            self.navigationItem.leftBarButtonItem = cancelItem;
        }
    }
    return self;
}

/*
 * Override the desinated initializer to make illegal to use
 * the superclass designated initializer
 */
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    @throw [NSException exceptionWithName:@"Wrong initializer" reason:@"Use initForNewItem:" userInfo:nil];
    return nil;
}



-(void) viewDidLoad
{
    [super viewDidLoad];
    
    // prepare the toolbar
    UIToolbar *numberToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelValueEnter)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneValueEnter)],
                           nil];
    [numberToolbar sizeToFit];
    self.valueField.inputAccessoryView = numberToolbar;
    
    // Create a UIIMageView programatically and add constraints for Auto Layout
    UIImageView *iv = [[UIImageView alloc] initWithImage:nil];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    //DO not produce a translated constratint for this view - this is to avoid autoresizing to perform his job
    // autoresizing is the method previous to Auto Layout to resize views.
    iv.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:iv];
    self.imageView = iv;
    
    // adding constraints programmatically
    NSDictionary *nameMap = @{@"imageView":self.imageView,
                              @"dateLabel":self.dateLabel,
                              @"toolbar":self.toolbar};
    // imageview is 0 pts from superview at left and right edges
    // "H:|-0-[imageView]-0-|: this is how to express the constraints, where H: horizontal
    //                                                                       |: referrs to the container view
    //                                                                       -pts-: pts the number of points
    //                                                                       []: the name of the view to add the constraint to (from the array)
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:nameMap];
    
    // imageview is 8 pts from the dateLabel at its top edge
    // and 8 pts from the toolbar at its bottom edge
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[dateLabel]-8-[imageView]-8-[toolbar]" options:0 metrics:nil views:nameMap];
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];
    
    
}


/*
 * Method called just before than the ViewController shows its view.
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    [self prepareViewsForOrientation:orientation];
    
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

    // Dismiss the popover if is on iPad
    if(self.imagePickerPopover) {
        [self.imagePickerPopover dismissPopoverAnimated:YES];
        self.imagePickerPopover = nil;
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}


/**
 * Implement the delegate from UITextFieldDelegate to dismiss the keyboard
 */
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



/*
 * If the devie is an iPhone and the orientation is landscape,
 * hide the image view and disable the buttons for image
 */
-(void) prepareViewsForOrientation:(UIInterfaceOrientation)orientation
{
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        // device is an iPad
        return;
    }
    
    if(UIInterfaceOrientationIsLandscape(orientation)) {
        // Is in landascape in an iPhone
        self.imageView.hidden = YES;
        self.cameraButton.enabled = NO;
        self.deleteImageButton.enabled = NO;
    } else {
        self.imageView.hidden = NO;
        self.cameraButton.enabled = YES;
        self.deleteImageButton.enabled = YES;
    }
    
}


/**
 * Called each time that the popover controller is dismissed
 */
-(void) popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog(@"User dismissed popover");
    self.imagePickerPopover = nil;
}


/**
 * Called every time that the device is rotated
 */
-(void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self prepareViewsForOrientation:toInterfaceOrientation];
}


/*
 * Method from the selector to the save button
 * at the naviagtion view
 */
-(void)save:(id)sender
{
    // presentingViewController is a reference to the view controller that created this view controller
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
}


-(void)cancel:(id)sender
{
    // If the user cancelled, then remove the item from the store
    [[BNRItemStore sharedStore]removeItem:self.item];
    [self.presentingViewController dismissViewControllerAnimated:YES completion:self.dismissBlock];
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
    
    if([self.imagePickerPopover isPopoverVisible]) {
        [self.imagePickerPopover dismissPopoverAnimated:YES];
        self.imagePickerPopover = nil;
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    // if the devices has a camera, take a picture. Otherwise, just pick from photo library
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        self.imagePickerPopover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        self.imagePickerPopover.delegate = self;
        [self.imagePickerPopover presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    
}
- (IBAction)removePicture:(id)sender {
    
    NSString *itemKey = _item.itemKey;
    [[BNRImageStore sharedStore] deleteImageForKey:itemKey];
    self.imageView.image = nil;
}



@end
