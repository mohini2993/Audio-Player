//
//  ViewController.m
//  day16ios_AudioPlayer
//
//  Created by Student 01 on 27/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
int flag=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allSongsName=@[@"Kaabil Hoon (Kaabil) -320Kbps",@"Befikra",@"Kar Gayi Chull (Kapoor & Sons) -320Kbps [DJMaza.Info]",@"Main Tera Boyfriend",@"02 - Manwa Laage (Happy New Year)  [FreshMaza.Info]",@"Nashe Si Chadh Gayi - 320Kbps"];
     self.url=[[NSBundle mainBundle]URLForResource:self.selectedSongName withExtension:@"mp3"];
   
    self.audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:self.url error:nil];
    self.audioPlayer.volume=4;
    self.timerSlider.minimumValue=0;
    self.timerSlider.maximumValue=self.audioPlayer.duration;
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.allSongsName.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text=[self.allSongsName objectAtIndex:indexPath.row];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.audioPlayer.currentTime >0)
    {
        self.audioPlayer.currentTime=0;
        [self.audioPlayer stop];
    }
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    self.selectedSongName=cell.textLabel.text;
     NSLog(@"Selected Name: %@",self.selectedSongName);
    self.nameLabel.text=self.selectedSongName;
    self.url=[[NSBundle mainBundle]URLForResource:self.selectedSongName withExtension:@"mp3"];
    self.audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:self.url error:nil];
    self.audioPlayer.volume=4;
    self.timerSlider.minimumValue=0;
    self.timerSlider.maximumValue=self.audioPlayer.duration;
    
}
    
- (IBAction)playButton:(id)sender
{
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(seekTime) userInfo:nil repeats:YES];
    self.audioPlayer.currentTime=self.timerSlider.value;
    [self.audioPlayer play];
    flag=0;
}
-(void)seekTime
{
    if(flag==0)
    {
        self.timerSlider.value=self.timerSlider.value+1;
    }
}

- (IBAction)pauseButton:(id)sender
{
    [self.audioPlayer pause];
    flag=2;
}

- (IBAction)stopButton:(id)sender
{
    [self.audioPlayer stop];
    self.timerSlider.value=0;
    self.nameLabel.text=@" ";
    flag=1;
}
- (IBAction)volumeButton:(id)sender
{
    self.audioPlayer.volume=self.volumeSlider.value;
}

- (IBAction)timeButton:(id)sender
{
    self.audioPlayer.currentTime=self.timerSlider.value;
}
@end
