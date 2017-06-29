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

//Randomize roll and set NSString display & value for score calculation
- (void)roll {
    int rollDice = arc4random_uniform(6);
    switch (rollDice) {
        case 0:
            self.display = @"⚀ - I";
            self.value = 1;
            break;
        case 1:
            self.display = @"⚁ - II";
            self.value = 2;
            break;
        case 2:
            self.display = @"⚂ - III";
            self.value = 0;
            break;
        case 3:
            self.display = @"⚃ - IV";
            self.value = 4;
            break;
        case 4:
            self.display = @"⚄ - V";
            self.value = 5;
            break;
        case 5:
            self.display = @"⚅ - VI";
            self.value = 6;
            break;
            
    }
}

@end
