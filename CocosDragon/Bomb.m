//
//  Bomb.m
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "Bomb.h"
#import "Dragon.h"
#import "CCBReader.h"

@implementation Bomb

- (void) handleCollisionWith:(GameObject *)gameObject
{
    if ([gameObject isKindOfClass:[Dragon class]]) {
        self.isScheduledForRemove = YES;
        
        CCNode *explosion = [CCBReader nodeGraphFromFile:@"Explosion.ccbi"];
        explosion.position = self.position;
        [self.parent addChild:explosion];
    }
}

- (float) radius
{
    return 15;
}

@end
