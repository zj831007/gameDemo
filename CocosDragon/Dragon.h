//
//  Dragon.h
//  CocosDragon
//
//  Created by Justin on 12-12-25.
//
//

#import "GameObject.h"

@interface Dragon : GameObject

{
    float ySpeed;
    float xTarget;
}

@property (nonatomic, assign) float xTarget;

@end
