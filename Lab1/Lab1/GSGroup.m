//
//  GSGroup.m
//  Lab1
//
//  Created by Sukhorukov Grigory on 20.02.16.
//  Copyright © 2016 Sukhorukov Grigory. All rights reserved.
//

#import "GSGroup.h"

@implementation GSGroup

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.students = [NSMutableArray array];
        self.teachers = [NSMutableArray array];
    }
    return self;
}

- (void) addStudent:(GSStudent*) student{
    if (self.students && ![self.students containsObject:student]) {
        [self.students addObject:student];
        for (GSTeacher* teacher in self.teachers) {
            [teacher addDependent:student];
        }
    }
}

- (void) removeStudent:(GSStudent*) student{
    if (self.students && [self.students containsObject:student]) {
        [self.students removeObject:student];
        for (GSTeacher* teacher in self.teachers) {
            [teacher removeDependent:student];
        }
    }
}


- (void) addTeacher:(GSTeacher*) teacher{
    if (self.teachers && ![self.teachers containsObject:teacher]) {
        [self.teachers addObject:teacher];
        for (GSStudent* student in self.students) {
            [student addMaster:teacher];
        }
    }
}

- (void) removeTeacher:(GSTeacher*) teacher{
    if (self.teachers && [self.teachers containsObject:teacher]) {
        [self.teachers removeObject:teacher];
        for (GSStudent* student in self.students) {
            [student removeMaster:teacher];
        }
    }
}

@end