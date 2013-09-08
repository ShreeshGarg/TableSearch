//
//  ViewController.h
//  TableSearch
//
//  Created by Developer on 29/11/12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UITextFieldDelegate>
{
    NSMutableArray *tableArray; // stores all data 
    NSMutableArray *filterArray; // stores only searched data 
    NSMutableArray *displayArray; // shows data on table
}
@property (retain, nonatomic) IBOutlet UISearchBar *serchBar;
@property (retain, nonatomic) IBOutlet UITableView *tbl;

@end
