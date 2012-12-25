//
//  Explosion.m
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "Explosion.h"


@implementation Explosion


- (void) didLoadFromCCB
{
    CCBAnimationManager *animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    self.isScheduledForRemove = YES;
}

@end
