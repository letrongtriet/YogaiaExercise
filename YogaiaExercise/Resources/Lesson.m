//
//  Lesson.m
//  CodeSample
//
//  Created by Teemu Polvi on 01/03/2019.
//  Copyright © 2019 Yogaia. All rights reserved.
//

#import "Lesson.h"

@implementation Lesson

+ (NSArray*) getTestLessonList {
    NSMutableArray *mutableArray = [NSMutableArray array];

    [mutableArray addObject:[[Lesson alloc] initWithLessonId:@"1001" name:@"Neck Release" lessonDescription:@"Free tension and tightness from your neck is this short, sweet, and effective mini practice." instructorName:@"Kali Alexander" instructorImageUrl:@"http://yogaia.com/imgext/teacher/KaliManduka.jpg" level:@"All" durationMinutes:@10]];
    
    [mutableArray addObject:[[Lesson alloc] initWithLessonId:@"1002" name:@"Yoga For Open Hips" lessonDescription:@"This class will work through poses to open the hips which can ease lower back pain and help with postural alignment. Props such as a pillow/cushion, a blanket, or yoga belt/strap can be helpful." instructorName:@"Shanine Collinson" instructorImageUrl:@"http://yogaia.com/imgext/teacher/Shanine_newheadshot.jpg" level:@"All" durationMinutes:@30]];
    
    [mutableArray addObject:[[Lesson alloc] initWithLessonId:@"1003" name:@"Yoga Basics" lessonDescription:@"This class is for anyone wanting to fine tune the basics of their yoga practice. This is a step by step class, each week we will learn a different pose, movement pathway, or other Yogic practice such as breathing. Moving at a slower pace and focused on alignment, all levels will develop knowledge on; proper alignment, purpose as well as modifications and alternatives, building a strong foundation and knowledge base for your future practice. Props such as a block and a belt may be helpful." instructorName:@"Robyn McLaren" instructorImageUrl:@"http://yogaia.com/imgext/teacher/robyn2.jpg" level:@"1" durationMinutes:@30]];
    
    [mutableArray addObject:[[Lesson alloc] initWithLessonId:@"1004" name:@"Flow & Go" lessonDescription:@"Move to the beat of your breath with this dynamic series of postures created to build heat and make you smile." instructorName:@"Athena Engelman" instructorImageUrl:@"http://yogaia.com/imgext/teacher/AthenaM.jpg" level:@"1-2" durationMinutes:@15]];
    
    [mutableArray addObject:[[Lesson alloc] initWithLessonId:@"1005" name:@"Holy Foam Roller" lessonDescription:@"Decompress and set yourself free while delivering relief to all the major muscle groups in your body. A perfect respite from a hard day or a hard workout.  Grab your foam roller and let’s go!" instructorName:@"Mario Valverde" instructorImageUrl:@"http://yogaia.com/imgext/teacher/Mario1.jpg" level:@"3" durationMinutes:@20]];
         
    return mutableArray;
}

- (id) initWithLessonId: (NSString*) lessonId name:(NSString*) name lessonDescription:(NSString*) lessonDescription instructorName:(NSString*) instructorName instructorImageUrl:(NSString*) instructorImageUrl level:(NSString*) level durationMinutes:(NSNumber*)durationMinutes {
    self = [super init];
    
    if (self) {
        _lessonId = lessonId;
        _name = name;
        _lessonDescription = lessonDescription;
        _instructorName = instructorName;
        _instructorImageUrl = instructorImageUrl;
        _level = level;
        _durationMinutes = durationMinutes;
    }
    return self;
}

@end
