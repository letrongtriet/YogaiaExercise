//
//  Lesson.h
//  CodeSample
//
//  Created by Teemu Polvi on 01/03/2019.
//  Copyright © 2019 Yogaia. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Lesson : NSObject

+ (NSArray*) getTestLessonList;

@property (nonatomic, readonly) NSString *lessonId;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *lessonDescription;
@property (nonatomic, readonly) NSString *instructorName;
@property (nonatomic, readonly) NSString *instructorImageUrl;
@property (nonatomic, readonly) NSString *level;
@property (nonatomic, readonly) NSNumber *durationMinutes;

@end

NS_ASSUME_NONNULL_END
