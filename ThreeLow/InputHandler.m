//
//  InputHandler.m
//  Maths
//
//  Created by Errol Cheong on 2017-06-27.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        char inputChar[255];
        
        fgets(inputChar, 255, stdin);
        NSString *inputString = [NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding];
        NSCharacterSet *newLineChar = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        _cleanString = [inputString stringByTrimmingCharactersInSet:newLineChar];
    }
    return self;
}/

//Class method to obtain string input and remove newline char
+ (NSString *)obtainInput {
        char inputChar[255];
        
        fgets(inputChar, 255, stdin);
        NSString *inputString = [NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding];
        NSCharacterSet *newLineChar = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        return [inputString stringByTrimmingCharactersInSet:newLineChar];
}

@end
