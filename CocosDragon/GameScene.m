//
//  GameScene.m
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "GameScene.h"
#import "CCBReader.h"

static GameScene *sharedScene;


@implementation GameScene
@synthesize score;


+ (GameScene *) sharedScene
{
    return sharedScene;
}

- (void) didLoadFromCCB
{
    sharedScene = self;
    self.score = 0;
    level = [CCBReader nodeGraphFromFile:@"Level.ccbi"];
    [levelLayer addChild:level];
}

- (void) setScore:(int)s
{
    score = s;
    [scoreLabel setString:[NSString stringWithFormat:@"%d", s]];
}

- (void) handleGameOver
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenuScene.ccbi"]];
}

- (void) handleLevelComplete
{
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"MainMenuScene.ccbi"]];
}

@end
