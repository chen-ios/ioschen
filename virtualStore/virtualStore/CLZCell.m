//
//  CLZCell.m
//  virtualStore
//
//  Created by ioschen on 9/18/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import "CLZCell.h"

@implementation CLZCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
