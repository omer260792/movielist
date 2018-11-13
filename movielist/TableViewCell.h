//
//  TableViewCell.h
//  movielist
//
//  Created by Omer Cohen on 11/11/18.
//  Copyright © 2018 Omer Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UILabel *titleCell;
@property (weak, nonatomic) IBOutlet UILabel *ratingCell;
@property (weak, nonatomic) IBOutlet UILabel *yaerCell;
@property (weak, nonatomic) IBOutlet UILabel *genreCell;

@end

NS_ASSUME_NONNULL_END
