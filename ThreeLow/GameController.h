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
@property (nonatomic) NSInteger requiredHoldCounter;
@property (nonatomic) NSInteger currentHoldCounter;
@property (nonatomic) NSInteger scoreToBeat;

- (void) gameOptions;
- (void) displayDices;
- (void) rollDices;
- (void) holdDie:(NSInteger)diceNumber;
- (void) resetDice;
- (void) calcScore;
- (void) resetScoreToBeat;
- (void) secretWinGameCheat;

@end
