//
//  MainMenuScene.m
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "MainMenuScene.h"
#import "CCBReader.h"

@implementation MainMenuScene


- (void) pressedPlay:(id)sender
{
    CCScene *gameScene = [CCBReader sceneWithNodeGraphFromFile:@"GameScene.ccbi"];
    [[CCDirector sharedDirector] replaceScene:gameScene];
}



@end
