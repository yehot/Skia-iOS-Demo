# Skia-iOS-Demo

## 关于 Skia

![](https://upload-images.jianshu.io/upload_images/332029-c476f74449914230.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Skia 是一个 Google 开源的 C++ 二维图形库，提供各种常用的API，并可在多种软硬件平台上运行。
谷歌 **Chrome 浏览器**、Chrome OS、**Android 系统**、火狐浏览器、火狐操作系统以及其它许多产品都使用它作为图形引擎。
特别是近两年开始大火的跨平台 App 开发框架 **Flutter**，其图形引擎也是基于 Skia。 Android 系统内置了 Skia，这也是 Flutter Android SDK 要比 Flutter iOS SDK 小一些的原因。

Skia 在 Chrome 和 Android 上作为底层的**图形引擎**，可以类比为 iOS 上的 **Core Graphic / Core Animation** 一层的框架，可能 Google 并没有大力在上层推广这个框架，所以前端、移动端开发者却很少有人在关注 Skia。甚至一些做了多年 Android 开发的同事也不知道有这个东西，也可能跟 Android 系统并没有在 Java 层暴露 Skia 的 API 有关。


Skia 的中英文资料比较少，Skia 官方给的 iOS Demo 也是完全抛弃了 iOS 原生的 Window、Application、View 体系，用 C++ 实现了一版。

**在 iOS 里使用 Skia**，目前除了 **Flutter**，还没有发现其它案例。iOS 内置的 UI 框架已经足够好用，如果不是为了实现跨平台的能力，也不太用的到 Skia。

**如何将 C++ 的 Skia 元素，渲染到 iOS 原生的 UIView 体系上**，Skia 本身没有提供解决方案，iOS 端就更没有接口可以用了。所以想**在 iOS 平台跑一个 Skia 的 Demo**还是比较麻烦的，我参考了 OpenGL 的绘制思路，这里实现了一个将 Skia 的视图元素 Canvas 的 Bitmap，绘制到 iOS 原生 UIView 体系上的一个 Demo。真正应用时不会这样用，可以借助 SDL 或 OpenGL ES 渲染到 Native 层。

![skia demo](https://upload-images.jianshu.io/upload_images/332029-c0209f0167058cae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## Skia in Chrome

可以在 Chrome 里，体验一下 Skia 的 API: https://fiddle.skia.org/c/@shapes

![](https://upload-images.jianshu.io/upload_images/332029-a2754878e10bf808.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
