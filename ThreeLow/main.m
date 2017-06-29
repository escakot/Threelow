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
                
            }
            
            if ([inputString hasPrefix:@"hold"]){
                NSInteger diceNumber = [inputString substringFromIndex:(inputString.length - 1)].integerValue;
                [gameController holdDie:diceNumber];
            }
            
            if ([inputString hasPrefix:@"reset"]){
                [gameController resetDice];
            }
            
            if ([inputString isEqualToString:@"quit"]){
                playGame = NO;
                NSLog(@"Game ended");
            }
            
        }while(playGame);
    }
    return 0;
}
