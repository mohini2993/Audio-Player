//
//  ViewController.h
//  day16ios_AudioPlayer
//
//  Created by Student 01 on 27/09/17.
//  Copyright © 2017 mohini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (IBAction)playButton:(id)sender;


- (IBAction)pauseButton:(id)sender;

- (IBAction)stopButton:(id)sender;

@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UISlider *timerSlider;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)volumeButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)timeButton:(id)sender;
@property AVAudioPlayer *audioPlayer;

@property NSArray *allSongsName;
@property NSURL *url;
@property NSString *selectedSongName;
@end

