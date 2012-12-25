//
//  GameObject.h
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "CCNode.h"

@interface GameObject : CCNode
{
    BOOL isScheduledForRemove;
}
@property (nonatomic, assign) BOOL isScheduledForRemove;
@property (nonatomic, readonly) float radius;


- (void) update;
- (void) handleCollisionWith:(GameObject *) gameObject;

@end
