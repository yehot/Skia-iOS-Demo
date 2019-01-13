//
//  ViewController.m
//  Skia-Demo
//
//  Created by yehot on 2019/1/9.
//  Copyright © 2019年 Xin Hua Zhi Yun. All rights reserved.
//

#import "ViewController.h"
#import "SkCanvas.h"
#import "SkGraphics.h"
#import "SkSurface.h"
#import "SkString.h"
#import "SkRRect.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    int width = 300;
    int height = 500;
    
    
    SkBitmap bitmap;
    bitmap.setInfo(SkImageInfo::Make(width, height, kRGBA_8888_SkColorType, kOpaque_SkAlphaType, nullptr));
    bitmap.allocPixels();
    
    SkCanvas canvas(bitmap);
    canvas.drawColor(SK_ColorWHITE);
    
    SkPaint paint;
    paint.setStyle(SkPaint::kFill_Style);
    paint.setAntiAlias(true);
    paint.setStrokeWidth(4);
    paint.setColor(0xffFE938C);
    
    SkRect rect_sk = SkRect::MakeXYWH(10, 30, 100, 160);
    canvas.drawRect(rect_sk, paint);
    
    SkRRect oval;
    oval.setOval(rect_sk);
    oval.offset(40, 80);
    paint.setColor(0xffE6B89C);
    canvas.drawRRect(oval, paint);
    
    paint.setColor(0xff9CAFB7);
    canvas.drawCircle(180, 50, 25, paint);
    
    rect_sk.offset(80, 50);
    paint.setColor(0xff4281A4);
    paint.setStyle(SkPaint::kStroke_Style);
    canvas.drawRoundRect(rect_sk, 10, 10, paint);
    
    
    SkPaint p;
    p.setTextSize(20);
    p.setStrokeWidth(2.0);
    p.setAntiAlias(true);
    p.setColor(SK_ColorBLACK);
    const char* str = "hello world";
    canvas.drawText(str, strlen(str), 50, 300, p);
    
    
    void* data = bitmap.getPixels();
    
    NSUInteger dataLength = width * height * 4;
    CGDataProviderRef ref = CGDataProviderCreateWithData(NULL, data, dataLength, NULL);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGImageRef iref = CGImageCreate(width, height, 8, 32, width * 4, colorspace,
                                    kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast,
                                    ref, NULL, true, kCGRenderingIntentDefault);
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    CGContextRef cgcontext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(cgcontext, 0, height);
    CGContextScaleCTM(cgcontext, 1.0, -1.0);
    CGContextSetBlendMode(cgcontext, kCGBlendModeCopy);
    CGContextDrawImage(cgcontext, CGRectMake(0.0, 0.0, width, height), iref);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CFRelease(ref);
    CFRelease(colorspace);
    CGImageRelease(iref);
    bitmap.reset();
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, width, height);
    
    [self.view addSubview:imageView];
}

@end
