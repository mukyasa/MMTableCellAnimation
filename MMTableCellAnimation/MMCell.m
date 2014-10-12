//
//  MMCell.m
//  MMTableCellAnimation
//
//  Created by muku on 12/10/14.
//  Copyright (c) 2014 com.muku. All rights reserved.
//

#import "MMCell.h"

@implementation MMCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
