//
//  Dice.m
//  ThreeLow
//
//  Created by Errol Cheong on 2017-06-28.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self roll];
    }
    return self;
}

- (void)roll {
    int rollDice = arc4random_uniform(6);
    switch (rollDice) {
        case 0:
            self.value = @"⚀ - I";
            break;
        case 1:
            self.value = @"⚁ - II";
            break;
        case 2:
            self.value = @"⚂ - III";
            break;
        case 3:
            self.value = @"⚃ - IV";
            break;
        case 4:
            self.value = @"⚄ - V";
            break;
        case 5:
            self.value = @"⚅ - VI";
            break;
            
    }
}

@end
