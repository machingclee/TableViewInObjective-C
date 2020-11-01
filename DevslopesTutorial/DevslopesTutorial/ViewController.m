//
//  ViewController.m
//  DevslopesTutorial
//
//  Created by Ching-Cheong Lee on 1/11/2020.
//

#import "ViewController.h"
#import "Classes/HTTPService.h"
#import "Models/Video.h"
#import "VideoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.videoList = NSArray.new;

    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSError * _Nullable errMessage) {
        if(dataArray){
            NSMutableArray *arr = NSMutableArray.new;
            
            for (NSDictionary *data in dataArray){
                Video *video = Video.new;
                video.videoTitle = [data        objectForKey:@"title"];
                video.videoDescription = [data  objectForKey:@"description"];
                video.videoIframe = [data       objectForKey:@"iframe"];
                video.thumbnail = [data         objectForKey:@"thumbnail"];
                
                [arr addObject:video];
            }
            
            self.videoList = arr;
            [self updateTableData];
        }
        
    }];
    
    
}

- (void) updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VideoCell * cell = (VideoCell *)[tableView dequeueReusableCellWithIdentifier:@"main"];
    
    if(!cell){
        cell = VideoCell.new;
    }
    
    return cell;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *vidCell = (VideoCell *) cell;
    [vidCell updateUI:video];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.videoList.count;
}

@end
