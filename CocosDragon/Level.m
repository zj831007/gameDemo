//
//  Level.m
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "Level.h"
#import "Dragon.h"
#import "GameObject.h"


#define kCJScrollFilterFactor 0.1
#define kCJDragonTargetOffset 80

@implementation Level

- (void) onEnter
{
    [super onEnter];
    [self schedule:@selector(update:)];
    self.isTouchEnabled = YES;
}
- (void) onExit
{
    [self unscheduleAllSelectors];
}
- (void) update:(ccTime)delta
{
    CCNode *child;
    CCARRAY_FOREACH(self.children, child)
    {
        if ([child isKindOfClass:[GameObject class]]) {
            GameObject *gameObject = (GameObject *)child;
            [gameObject update];
            
            if (gameObject != dragon) {
                if (ccpDistance(gameObject.position, dragon.position) < gameObject.radius + dragon.radius) {
                    [gameObject handleCollisionWith:dragon];
                    [dragon handleCollisionWith:gameObject];
                }
            }
        }
    }
    
    
    NSMutableArray *gameObjectsToRemove = [NSMutableArray array];
    CCARRAY_FOREACH(self.children, child)
    {
        if ([child isKindOfClass:[GameObject class]]) {
            GameObject *gameObject = (GameObject *)child;
            if (gameObject.isScheduledForRemove) {
                [gameObjectsToRemove addObject:gameObject];
            }
        }
    }
    
    for (GameObject *gameObject in gameObjectsToRemove) {
        [self removeChild:gameObject cleanup:YES];
    }
    
    float yTarget = kCJDragonTargetOffset - dragon.position.y;
    CGPoint oldLayerPosition = self.position;
    float xNew = oldLayerPosition.x;
    float yNew = yTarget * kCJScrollFilterFactor + oldLayerPosition.y * (1.0f - kCJScrollFilterFactor);
    self.position = ccp(xNew, yNew);
}

- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:[touch view]];
    dragon.xTarget = touchLocation.x;
}

- (void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:[touch view]];
    dragon.xTarget = touchLocation.x;
}

@end
