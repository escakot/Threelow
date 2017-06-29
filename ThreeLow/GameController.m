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
        _scoreToBeat = 30; //Maximum score
        _requiredHoldCounter = 1; //Require at least 1 dice hold at start
        _currentHoldCounter = 0; //No dice are held at the start
        //Initiate dice instances
        Dice *firstDice = [[Dice alloc] init];
        Dice *secondDice = [[Dice alloc] init];
        Dice *thirdDice = [[Dice alloc] init];
        Dice *fourthDice = [[Dice alloc] init];
        Dice *fifthDice = [[Dice alloc] init];
        //Store dice objects into array
        _dices = [@[firstDice, secondDice, thirdDice, fourthDice, fifthDice] mutableCopy];
        //Store BOOL to identify held dices based on index
        _heldDices = [@[@(NO), @(NO), @(NO), @(NO), @(NO)] mutableCopy];
    }
    return self;
}

// Display message for Game Options
- (void) gameOptions {
    NSLog(@"\n"
          "Threelow Game Options:\n"
          "roll - Rolls unheld dice\n"
          "hold # - Hold/Unhold die at index #\n"
          "reset - Unholds all dice\n"
          "new game - Reset high score\n"
          "quit - Quits game\n");
}

//Display Dice Status (Hold/Unhold)
- (void) displayDices {
    //Create string for concatenation for easy view
    NSMutableString *concatString = [[NSMutableString alloc] initWithString:@"\n"];
    self.currentHoldCounter = 0; //Reset current dice hold counter
    //Loop through all dices
    [self.dices enumerateObjectsUsingBlock:^(Dice*  _Nonnull diceNumber, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber* heldBool = self.heldDices[idx];
        //Add [ ] if dices are held based on BOOLEAN index
        if (heldBool.boolValue){
            [concatString appendString:[NSString stringWithFormat:@"[%@]",diceNumber.display]];
            self.currentHoldCounter++;
        } else {
            [concatString appendString:diceNumber.display];
        }
        [concatString appendString:@"\n"]; //Append string for easy view
    }];
    NSLog(@"%@", concatString); //Display all dices in a single NSLog
}

//Roll unheld dices
- (void)rollDices {
    //Check if you held 1 extra die after a roll
    if (self.requiredHoldCounter <= self.currentHoldCounter) {
        //Loop through all dices, roll unheld dices
        [self.dices enumerateObjectsUsingBlock:^(Dice*  _Nonnull diceNumber, NSUInteger idx, BOOL * _Nonnull stop) {
            NSNumber* heldBool = self.heldDices[idx];
            if (!heldBool.boolValue){
                [diceNumber roll];
            }
        }];
        //Ensure a hold on next roll if more than 1 hold this turn
        if (self.currentHoldCounter > self.requiredHoldCounter) {
            self.requiredHoldCounter = self.currentHoldCounter;
        }
        //Add a required roll for next turn
        self.requiredHoldCounter++;
    
    //Maximum number of rolls
    } else if (self.requiredHoldCounter == 5) {
        NSLog(@"Max number of rolls. Please reset");
        sleep(1.5);
    //Ensure that your hold 1 extra dice each turn
    } else {
        NSLog(@"You need to hold at least %lu dice.", self.requiredHoldCounter);
        sleep(1.5);
    }
    
}

// Hold/Unhold dice
- (void) holdDie:(NSInteger)diceNumber {
    // Changes YES to NO and NO to YES
    // for dice hold boolean index
    if ([self.heldDices[diceNumber]  isEqual: @(YES)]){
        self.heldDices[diceNumber] = @(NO);
    } else {
        self.heldDices[diceNumber] = @(YES);
    }
}

// Reset all dices to unheld
- (void)resetDice {
    self.heldDices = [@[@(NO), @(NO), @(NO), @(NO), @(NO)] mutableCopy];
    // Reroll all dices to reset game
    [self rollDices];
    self.requiredHoldCounter = 1; //Reset required holds again
}

// Calculate total score based on dices (III are 0s)
- (void) calcScore {
    NSInteger totalScore = 0;
    //Loop through all dices to sum total score
    for (Dice* die in self.dices) {
        totalScore = totalScore + die.value;
    }
    // Calculate score to beat
    if (self.scoreToBeat > totalScore) {
        self.scoreToBeat = totalScore;
    }
    //Display current score and highscore
    NSLog(@"\nTotal score:%li, Score to beat:%li\n", totalScore, self.scoreToBeat);
}

//Reset high score
- (void) resetScoreToBeat {
    self.scoreToBeat = 30;
}

@end
