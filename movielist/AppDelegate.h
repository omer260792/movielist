//
//  AppDelegate.h
//  movielist
//
//  Created by Omer Cohen on 11/11/18.
//  Copyright © 2018 Omer Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

