//
//  ViewController.m
//  movielist
//
//  Created by Omer Cohen on 11/11/18.
//  Copyright © 2018 Omer Cohen. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController (){
    
    AppDelegate *appDelegate;
    NSManagedObjectContext *context;

}

@end
struct Data dataMovie;
NSArray *moviesJSON;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //get context
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    context = appDelegate.persistentContainer.viewContext;
    self.fethCoursesUsingJson;

}

- (void)fethCoursesUsingJson{
    

    NSString *urlString = @"https://api.androidhive.info/json/movies.json";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSString *dummyString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSError *err;
        moviesJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"faild:%@",err);
            return ;
        }
        
        for (NSDictionary *moviesDict in moviesJSON) {
            
            
            NSString *name = moviesDict[@"title"];
            NSNumber *releaseYear = moviesDict[@"releaseYear"];
            NSNumber *rating = moviesDict[@"rating"];
            NSString *image = moviesDict[@"image"];
            NSString *genre = moviesDict[@"genre"];
            NSString *barcode = @"";
            
            // Converting String into Integer
            double ratingDouble = [rating doubleValue];
            double releaseYearDouble = [releaseYear doubleValue];
            
            NSNumber *doubleStringrating = [NSNumber numberWithDouble:ratingDouble];
            NSNumber *doubleStringreleaseYear = [NSNumber numberWithDouble:releaseYearDouble];
            
            //save data in Core data
            data = [NSEntityDescription insertNewObjectForEntityForName:@"Data" inManagedObjectContext:self->context];
            [data setValue:name forKey:@"title"];
            [data setValue:releaseYear forKey:@"releaseYear"];
            [data setValue:rating forKey:@"rating"];
            [data setValue:image forKey:@"image"];
            [data setValue:genre.description forKey:@"genre"];
            [data setValue:barcode forKey:@"barcode"];
            
            
            
            [self->appDelegate saveContext];
            
        }

    }]resume];

}



struct Data {
    NSString* title;
    NSNumber* rating;
    NSNumber* yaer;
    NSString* image;
    NSArray* genre;
    NSString* barcode;
    
};
@end
