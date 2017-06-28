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
          "roll - Rolls unheld dices\n"
          "hold # - Holds dices at index #\n"
          "quit - Quits game\n");
}

- (void) displayDices {
    NSMutableString *concatString = [[NSMutableString alloc] initWithString:@"\n"];
    __block NSString* diceStatus;
    [self.dices enumerateObjectsUsingBlock:^(Dice*  _Nonnull diceNumber, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber* heldBool = self.heldDices[idx];
        if (heldBool.boolValue){
            diceStatus = [NSString stringWithFormat:@"[%@]",diceNumber.value];
        } else {
            diceStatus = diceNumber.value;
        }
        [concatString appendString:diceStatus];
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

@end
