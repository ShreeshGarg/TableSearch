//
//  ViewController.m
//  TableSearch
//
//  Created by Developer on 29/11/12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize serchBar;
@synthesize tbl;

//
//
// Method to filter the data from total array with key, this method returns filtered array
//
//
-(NSMutableArray *)managingDisplayArrayFromArray:(NSMutableArray *)totalArray withKey:(NSString *)key
{
    NSMutableArray *ary=[[NSMutableArray alloc]init];
    key=[key lowercaseString];
    for (NSString *str in totalArray)
    {
      NSRange range = [str rangeOfString:key];
         if (range.location != NSNotFound )
             [ary addObject:str];
    
    }
    return ary;
}

// Implementation of textFiled delegate method
// This method will call on every type on text field of serach bar


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *keyString=[textField.text stringByAppendingString:string];
    displayArray=[self managingDisplayArrayFromArray:tableArray withKey:keyString];
    [self.tbl reloadData];
    return YES;
}


// Implementation of searchBar delegate method
// This method will call on search button click

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    displayArray=[self managingDisplayArrayFromArray:tableArray withKey:serchBar.text];
    [self.tbl reloadData];
    [self.serchBar resignFirstResponder];

}

// Implementation of searchBar delegate method
// This method will call on cancle button click

-(void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    displayArray=tableArray;
    [self.tbl reloadData];
    [self.serchBar resignFirstResponder];

}
#pragma mark -- Implementation of table view delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [displayArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    [cell.textLabel setText:[displayArray objectAtIndex:indexPath.row]];
    return cell;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initializing the arrays
    
    tableArray=[[NSMutableArray alloc]init];
    displayArray=[[NSMutableArray alloc]init];
    [tableArray addObject:@"ram"];
    [tableArray addObject:@"shyam"];
    [tableArray addObject:@"suresh"];
    [tableArray addObject:@"girjesh"];
    [tableArray addObject:@"sudhir"];
    [tableArray addObject:@"aknsha"];
    [tableArray addObject:@"vineeta"];
    [tableArray addObject:@"rakesh"];
    [tableArray addObject:@"himanshu"];
    [tableArray addObject:@"barkha"];
    displayArray=[NSMutableArray arrayWithArray:tableArray];
    self.serchBar.showsCancelButton=YES;
    
    // Following 3 line of code is written to support text field of searchBar and also here we are setting delegate of that text filed
    
    
    NSArray *subViewsArray=[self.serchBar subviews]; 
    UITextField *txtField=(UITextField *)[subViewsArray objectAtIndex:1];
    txtField.delegate=self;
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [serchBar release];
    [tbl release];
    [super dealloc];
}
@end
