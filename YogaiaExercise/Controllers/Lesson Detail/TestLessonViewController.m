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
@end

@implementation TestLessonViewController

#pragma mark - View controller life cycle
- (instancetype _Nonnull)init:(NSString *_Nonnull)lessonName {
    self = [super init];
    if (self) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle bundleForClass:[TestLessonViewController class]]];
        self = [sb instantiateViewControllerWithIdentifier:@"TestLessonViewController"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeViews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self.descriptionLabel setText:@"This is a very long text This is a very long text This is a very long text This is a very long text This is a very long text"];
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
