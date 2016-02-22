
#import "GSHuman.h"


@interface GSStudent : GSHuman

@property (assign, nonatomic) float averageScore;

- (instancetype)initRand;
- (instancetype)initWithName:(NSString*) name age:(NSInteger) age averageScore:(float) averageScore;

@end