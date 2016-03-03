//
//  DescriptionTableViewCell.h
//  DressConnectProject
//
//  Created by samosys on 2/17/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lbl_month;
@property (strong, nonatomic) IBOutlet UILabel *lbl_day;
@property (strong, nonatomic) IBOutlet UILabel *lbl_youCreated;
@property (strong, nonatomic) IBOutlet UILabel *lbl_date;
@property (strong, nonatomic) IBOutlet UILabel *lbl_title;

@end
