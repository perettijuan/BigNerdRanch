//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Juan Pablo Peretti on 26/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore()
@property(nonatomic,strong)NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+(instancetype)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}


-(instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRImageStore sharedStore]" userInfo:nil];
    return nil;
}


// Secret designated initializer
-(instancetype)initPrivate
{
    self = [super init];
    
    if(self) {
        _dictionary = [[NSMutableDictionary alloc] init];
        
        // subscribe to the NSNotificationCenter to handle
        // low memory issues if they appear
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(clearCache:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    
    return self;
}


-(void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
    NSString *imagePath = [self imagePathForKey:key];
    // NSData is a utility class that holds a number of bytes of binary data
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    [data writeToFile:imagePath atomically:YES];
}

-(UIImage *) imageForKey:(NSString *)key
{
    UIImage *image = self.dictionary[key];
    if(!image) {
        NSString *imagePath = [self imagePathForKey:key];
        image = [UIImage imageWithContentsOfFile:imagePath];
        if(image) {
            self.dictionary[key] = image;
        } else {
            NSLog(@"Error: unable to finde %@", [self imagePathForKey:key]);
        }
    }
    return image;
}

-(void)deleteImageForKey:(NSString *)key
{
    if(!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
    
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager]removeItemAtPath:imagePath error:nil];
}

-(NSString*)imagePathForKey:(NSString *)key
{
    NSArray *documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentsDirectory firstObject];
    return [documentDirectory stringByAppendingPathComponent:key];
}

// Called when the lo memory message is received
-(void)clearCache:(NSNotification*)note
{
    NSLog(@"Flushing %ld images out of the cache", [self.dictionary count]);
    [self.dictionary removeAllObjects];
}

@end
