//
//  main.m
//  Car
//
//  Created by 夏名 on 2018/3/12.
//  Copyright © 2018年 xiabob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UnityUtils.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        unity_init(argc, argv);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
