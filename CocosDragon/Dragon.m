//
//  Dragon.m
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "Dragon.h"
#import "Coin.h"
#import "Bomb.h"
#import "GameScene.h"
#import "CCBAnimationManager.h"


#define kCJStartSpeed 8
#define kCJCoinSpeed 8
#define kCJStartTarget 160

#define kCJTargetFilterFactor 0.05
#define kCJSlowDownFactor 0.995
#define kCJGravitySpeed 0.1
#define kCJGameOverSpeed -10
#define kCJDeltaToRotationFactor 5


@implementation Dragon

@synthesize xTarget;


- (id) init
{
    self = [super init];
    if (!self) {
        return NULL;
    }
    
    xTarget = kCJStartTarget;
    ySpeed = kCJStartSpeed;
    return self;
}

- (void) update
{
    CGPoint oldPosition = self.position;
    
    float xNew = xTarget * kCJTargetFilterFactor + oldPosition.x * (1-kCJTargetFilterFactor);
    float yNew = oldPosition.y + ySpeed;
    self.position = ccp(xNew, yNew);
    
    ySpeed = (ySpeed - kCJGravitySpeed) * kCJSlowDownFactor;
    
    float xDelta = xNew - oldPosition.x;
    self.rotation = xDelta * kCJDeltaToRotationFactor;
    
    if (ySpeed < kCJGameOverSpeed) {
        [[GameScene sharedScene] handleGameOver];
    }
    
}

- (void) handleCollisionWith:(GameObject *)gameObject
{
    if ([gameObject isKindOfClass:[Coin class]]) {
        ySpeed = kCJCoinSpeed;
        [GameScene sharedScene].score += 1;
    }
    else if([gameObject isKindOfClass:[Bomb class]])
    {
        if (ySpeed >0) {
            ySpeed = 0;
        }
        CCBAnimationManager *animationManager = self.userObject;
        NSLog(@"animationManager:%@", animationManager);
        [animationManager runAnimationsForSequenceNamed:@"Hit"];
        
    }
}

- (float) radius
{
    return 25;
}

@end
