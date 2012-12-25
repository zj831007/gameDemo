//
//  GameScene.h
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "CCLayer.h"

@interface GameScene : CCLayer
{
    CCLayer *levelLayer;
    CCLabelTTF *scoreLabel;
    CCNode *level;
    int score;
}
@property (nonatomic, assign) int score;

+ (GameScene *) sharedScene;

- (void) handleGameOver;
- (void) handleLevelComplete;

@end
