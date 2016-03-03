//
//  friendTableViewCell.h
//  DressConnectProject
//
//  Created by samosys on 2/18/16.
//  Copyright (c) 2016 Samosys.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface friendTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *img_listcheck;
@property (strong, nonatomic) IBOutlet UIImageView *img_userImg;
@property (strong, nonatomic) IBOutlet UILabel *lbl_userName;
@property (strong, nonatomic) IBOutlet UILabel *lbl_title;
@property (strong, nonatomic) IBOutlet UILabel *lbl_date;
@property (strong, nonatomic) IBOutlet UILabel *lbl_vote;
@property (strong, nonatomic) IBOutlet UILabel *lbl_comment;
@property (strong, nonatomic) IBOutlet UIImageView *img_reply;
@property (strong, nonatomic) IBOutlet UILabel *lbl_replytime;

@end
