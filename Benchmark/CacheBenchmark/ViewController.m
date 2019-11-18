//
//  ViewController.m
//  CacheBenchmark
//
//  Created by ibireme on 2017/6/29.
//  Copyright © 2017年 ibireme. All rights reserved.
//

#import "ViewController.h"
#include "Benchmark.h"
#import "YYCache.h"

@interface ViewController ()<YYDiskCacheDelegate, YYMemoryCacheDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [Benchmark benchmark];
//    });
    
    NSMutableData *dataValue = [NSMutableData new];
    for (int i = 0; i < 100 * 1024; i++) {
        [dataValue appendBytes:&i length:1];
    }
    NSLog(@"dataValue.length %@", @(dataValue.length));
    YYCache *cache = [[YYCache alloc] initWithName:@"test123"];
    cache.diskCache.costLimit = 30 * 100 * 1024;
    cache.memoryCache.costLimit = 10 * 100 * 1024;
    cache.diskCache.delegate = self;
    cache.memoryCache.delegate = self;
    cache.diskCache.autoTrimInterval = 5.0;
    cache.memoryCache.autoTrimInterval = 3.0;
    NSUInteger i = 0;
    while (true) {
        NSString *key = [NSString stringWithFormat:@"key-%@", @(i)];
        NSLog(@"cache set %@", key);
        [cache.memoryCache setObject:dataValue forKey:key withCost:dataValue.length];
//        [cache setObject:dataValue forKey:key];
        i ++;
        [NSThread sleepForTimeInterval:1.0];
    }
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)diskCacheDidEvictKeys:(NSMutableArray *)keys {
    NSLog(@"diskCacheDidEvictKeys %@", keys);
}

- (void)memoryCacheDidEvictKeys:(NSMutableArray *)keys {
    NSLog(@"memoryCacheDidEvictKeys %@", keys);
}

@end
