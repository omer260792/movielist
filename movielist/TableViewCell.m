//
//  TableViewCell.m
//  movielist
//
//  Created by Omer Cohen on 11/11/18.
//  Copyright © 2018 Omer Cohen. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize imageCell = _imageCell;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
