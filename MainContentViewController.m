//
//  MainContentViewController.m
//  StackOverflow
//
//  Created by Lindsey on 12/7/15.
//  Copyright © 2015 Lindsey Boggio. All rights reserved.
//

#import "MainContentViewController.h"
#import "SOSearchJSONParser.h"
#import "SOSearchAPIService.h"
#import "Questions.h"
#import "SearchResultTableViewCell.h"

@interface MainContentViewController ()<UITabBarDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSArray<Questions *> *Questions;


@end

@implementation MainContentViewController

-(void) setQuestions:(NSArray *)Questions{
    _Questions = Questions;
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) setupMainViewController{
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.searchBar setDelegate:self];
    
    UINib *nib = [UINib nibWithNibName:@"SearchResultTableViewCell" bundle:nil];
    [[self tableView]registerNib:nib forCellReuseIdentifier:@"SearchResultCell"];

    
}



#pragma mark - SOSearchAIPService

-(void) fetchResultsForSearchTerm:(NSString *)searchTerm {
    [SOSearchAPIService searchWithTerm:searchTerm pageNumber:1 withCompletion:^(NSDictionary * _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.description);
        } else {
            [SOSearchJSONParser questionsArrayFromDictionary:data completionHandler:^(NSArray * _Nullable data, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"Error: %@", error.description);
                }
                if (data.count >0){
                    Questions *questionOne = (Questions *) data.firstObject;
                    NSLog(@"Questions title one: %@", questionOne.title);
                    //[self SetQuestions:data];
                    return;
                }
            }];
        }
    }];
}

#pragma mark set up TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.Questions !=nil) {
        return self.Questions.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchResultTableViewCell *cell = (SearchResultTableViewCell *) [self.tableView dequeueReusableCellWithIdentifier:@"SearchResultCell"];
    
    cell.question = [self.Questions objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self fetchResultsForSearchTerm: self.searchBar.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
