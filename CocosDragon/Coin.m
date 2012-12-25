//
//  Coin.m
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "Coin.h"
#import "Dragon.h"
#import "GameScene.h"

@implementation Coin
@synthesize isEndCoin;


- (void) handleCollisionWith:(GameObject *)gameObject
{
    if ([gameObject isKindOfClass:[Dragon class]]) {
        if (isEndCoin) {
            [[GameScene sharedScene] handleLevelComplete];
        }
        self.isScheduledForRemove = YES;
    }
}

- (float) radius
{
    return 15;
}

@end
