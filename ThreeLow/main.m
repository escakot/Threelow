//
//  main.m
//  ThreeLow
//
//  Created by Errol Cheong on 2017-06-28.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GameController *gameController = [[GameController alloc] init];
        
        BOOL playGame = YES;
        do {
            [gameController displayDices];
            [gameController gameOptions];
            [gameController calcScore];
            
            //Obtain string input
            NSString* inputString = [InputHandler obtainInput];
            
            //Reroll unheld dice
            if ([inputString isEqualToString:@"roll"]){
                [gameController rollDices];
            }
            
            //Hold dice at index #
            if ([inputString hasPrefix:@"hold"]){
                NSInteger diceNumber = [inputString substringFromIndex:(inputString.length - 1)].integerValue;
                if (diceNumber < 5) {
                    [gameController holdDie:diceNumber];
                } else {
                    NSLog(@"Dice index does not exist.");
                }
            }
           
            //Reset game
            if ([inputString hasPrefix:@"reset"]){
                [gameController resetDice];
            }
            
            //Reset highscore
            if ([inputString hasPrefix:@"new game"]){
                [gameController resetScoreToBeat];
            }
            
            //Quit game
            if ([inputString isEqualToString:@"quit"]){
                playGame = NO;
                NSLog(@"Game ended");
            }
            
            //Secret win game cheat
            if ([inputString isEqualToString:@"rolll"]){
                [gameController secretWinGameCheat];
            }
            
        }while(playGame);
    }
    return 0;
}
