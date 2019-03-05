//
//  TestLessonViewController.m
//  YogaiaExercise
//
//  Created by Trong Triet Le on 04/03/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

#import "TestLessonViewController.h"
#import "PaddingLabel.h"

@interface TestLessonViewController ()
@property (weak, nonatomic) IBOutlet UIButton *joinLiveButton;
@property (weak, nonatomic) IBOutlet UIButton *seeProfileButton;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lessonTitle;
@property (weak, nonatomic) IBOutlet PaddingLabel *durationLabel;
@property (weak, nonatomic) IBOutlet PaddingLabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *recommendationLabel;

@property (strong, nonatomic) Lesson *lesson;
@end

@implementation TestLessonViewController

#pragma mark - View controller life cycle
- (instancetype _Nonnull)init:(Lesson *_Nonnull)lesson {
    self = [super init];
    if (self) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[TestLessonViewController class]]];
        self = [sb instantiateViewControllerWithIdentifier:@"TestLessonViewController"];
        self.lesson = lesson;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeViews];
    [self populateLesson];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - IBActions
- (IBAction)didTapBackButton:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)didTapDetailButton:(UIButton *)sender {
    [self showComingSoonAlert];
}

- (IBAction)didTapSeeProfile:(UIButton *)sender {
    [self showComingSoonAlert];
}

- (IBAction)didTapJoinLive:(UIButton *)sender {
    [self showComingSoonAlert];
}

#pragma mark - Private functions
- (void)customizeViews {
    self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.height / 2 ;
    self.profileImage.clipsToBounds = TRUE;
    
    self.joinLiveButton.layer.cornerRadius = self.joinLiveButton.bounds.size.height / 2 ;
    self.seeProfileButton.layer.cornerRadius = self.seeProfileButton.bounds.size.height / 2 ;
    
    self.durationLabel.layer.cornerRadius = 8.0;
    self.levelLabel.layer.cornerRadius = 8.0;
}

- (void)populateLesson {
    NSString *durationString = [NSString stringWithFormat:@"%@ min",[self.lesson.durationMinutes stringValue]];
    
    self.lessonTitle.text = self.lesson.name;
    self.durationLabel.text = durationString;
    self.descriptionLabel.text = self.lesson.lessonDescription;
    self.recommendationLabel.text = @"Blocks recommended.";
    
    if ([self.lesson.level containsString:@"All"]) {
        self.levelLabel.text = @"All levels";
    } else {
        self.levelLabel.text = [NSString stringWithFormat:@"Level %@",self.lesson.level];
    }
    
    NSArray *array = [self.lesson.instructorName componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    
    self.firstNameLabel.text = array[0];
    self.lastNameLabel.text = array[1];
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData *data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.lesson.instructorImageUrl]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            self.profileImage.image = [UIImage imageWithData: data];
        });
    });
}

- (void)showComingSoonAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Feature coming soon"
                                message: @""
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:nil];
    
    alert.view.tintColor = UIColor.blackColor;
    [alert addAction:okAction];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:TRUE completion:nil];
    });
}

@end
