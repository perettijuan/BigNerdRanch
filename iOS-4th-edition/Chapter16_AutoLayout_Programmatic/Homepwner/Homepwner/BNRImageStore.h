//
//  BNRImageStore.h
//  Homepwner
//
//  Created by Juan Pablo Peretti on 26/2/16.
//  Copyright (c) 2016 Juan Pablo Peretti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRImageStore : NSObject

// Singleton method
+(instancetype)sharedStore;

-(void)setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageForKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *) key;

@end
