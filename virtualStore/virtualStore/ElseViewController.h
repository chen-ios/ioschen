//
//  ElseViewController.h
//  virtualStore
//
//  Created by ioschen on 9/12/13.
//  Copyright (c) 2013 ioschen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ElseViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *otherArray;
    UITableView *otherTableView;
}
@end
