//
//  GameController.h
//  ThreeLow
//
//  Created by Errol Cheong on 2017-06-28.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property (nonatomic) NSMutableArray* dices;
@property (nonatomic) NSMutableArray* heldDices;

- (void) gameOptions;

- (void) displayDices;

- (void) holdDie:(NSInteger)diceNumber;

@end
