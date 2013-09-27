//
//  CLZCell.h
//  virtualStore
//
//  Created by ioschen on 9/18/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLZCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *clzImageView;
@property (weak, nonatomic) IBOutlet UILabel *clzPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *clzDwLabel;
@property (weak, nonatomic) IBOutlet UIButton *clzNumberBtn;
@end
