//
//  GameController.m
//  ThreeLow
//
//  Created by Errol Cheong on 2017-06-28.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        Dice *firstDice = [[Dice alloc] init];
        Dice *secondDice = [[Dice alloc] init];
        Dice *thirdDice = [[Dice alloc] init];
        Dice *fourthDice = [[Dice alloc] init];
        Dice *fifthDice = [[Dice alloc] init];
        _dices = [@[firstDice, secondDice, thirdDice, fourthDice, fifthDice] mutableCopy];
        _heldDices = [@[@(NO), @(NO), @(NO), @(NO), @(NO)] mutableCopy];
    }
    return self;
}

- (void) gameOptions {
    NSLog(@"\n"
          "roll - Rolls unheld dice\n"
          "hold # - Hold/Unhold die at index #\n"
          "reset - Unholds all dice\n"
          "quit - Quits game\n");
}

- (void) displayDices {
    NSMutableString *concatString = [[NSMutableString alloc] initWithString:@"\n"];
    [self.dices enumerateObjectsUsingBlock:^(Dice*  _Nonnull diceNumber, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber* heldBool = self.heldDices[idx];
        if (heldBool.boolValue){
            [concatString appendString:[NSString stringWithFormat:@"[%@]",diceNumber.display]];
        } else {
            [concatString appendString:diceNumber.display ];
        }
        [concatString appendString:@"\n"];
    }];
    NSLog(@"%@", concatString);
}

- (void) holdDie:(NSInteger)diceNumber {
    if ([self.heldDices[diceNumber]  isEqual: @(YES)]){
        self.heldDices[diceNumber] = @(NO);
    } else {
        self.heldDices[diceNumber] = @(YES);
    }
}

- (void)resetDice {
    self.heldDices = [@[@(NO), @(NO), @(NO), @(NO), @(NO)] mutableCopy];
}

- (void) calcScore {
    
}

@end
