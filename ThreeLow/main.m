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
            NSString* inputString = [InputHandler obtainInput];
            if ([inputString isEqualToString:@"roll"]){
                [gameController rollDices];
            }
            
            if ([inputString hasPrefix:@"hold"]){
                NSInteger diceNumber = [inputString substringFromIndex:(inputString.length - 1)].integerValue;
                if (diceNumber < 5) {
                    [gameController holdDie:diceNumber];
                } else {
                    NSLog(@"Dice index does not exist.");
                }
            }
            
            if ([inputString hasPrefix:@"reset"]){
                [gameController resetDice];
            }
            
            if ([inputString hasPrefix:@"new game"]){
                [gameController resetScoreToBeat];
            }
            
            
            if ([inputString isEqualToString:@"quit"]){
                playGame = NO;
                NSLog(@"Game ended");
            }
            
        }while(playGame);
    }
    return 0;
}
