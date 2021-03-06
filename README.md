# bounds-frame-Demo

- [我的简书](http://www.jianshu.com/u/b88081164fe8)
- [我的博客](https://maimieng.com)

> bounds & frame

- Info:
 - Swift 3.0
 - Xcode 8.2.1

## Update

> 2017.02.27 - CS193p Lecture 04

- 使用 frame & center 来**定位**视图
- 使用 bounds 来**绘制**视图

### frame.size != bounds.size

- 在视图旋转时，frame 的 size 和 bounds 的 size 将发生分歧，即 frame 的 size 将相对于父视图的坐标系而改变。
- 该示例已增加，详见 [kingcos/bounds-frame-Demo](https://github.com/kingcos/bounds-frame-Demo) 新增的 Demo。

### redraw

- 默认情况下，UIView 的 bounds 改变时，将不会重新绘制。
- 设置 Content Mode 为 redraw 即会重新绘制。
- UIViewContentMode: 内容模式（仅放置在某个位置、比例缩放、重新绘制）

## 前言

在 iOS 开发中，视图的 bounds 和 frame 是其最基本的属性。两者的类型均为 `CGRect`，即包含原点和宽高信息。那么这两个属性有什么区别和联系呢？为了搞清楚这一点，也为了方便以后的参考，所以总结于此。

## 概念

### frame

> The frame rectangle, which describes the view’s location and size in its **superview’s** coordinate system.

根据苹果的官方文档，frame 是控件相对于其**父视图**坐标系得出的位置和大小。

### center

其实提到 frame 和 bounds，不得不说的还有一个属性便是 center。

> The center of the frame.

根据苹果的官方文档，center 是自身控件 **frame** 的中心。

### bounds

> The bounds rectangle, which describes the view’s location and size in its own coordinate system.

根据苹果的官方文档，bounds 是控件相对于其**自身**坐标系得出的位置和大小。默认 bounds 中的原点为 (0, 0)。

## Demo

### 验证

概念的总结总是抽象的，不如一个 Demo 生动，因此写了一个 Demo 来验证以上的概念。该 Demo 您可以在 [kingcos/bounds-frame-Demo](https://github.com/kingcos/bounds-frame-Demo) 下载并使用 Xcode 运行。为了快速构建，该例中使用了 Storyboard。

![Demo](http://upload-images.jianshu.io/upload_images/227002-9344143dfd2b2a80.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

该 Demo 中，红色和蓝色按钮的父控件为 UIView，您可以在下图中看到，即蓝色选中的视图控件。

![控件层次](http://upload-images.jianshu.io/upload_images/227002-9208589daedf8308.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

通过 Demo 中的数据，我们可以很清楚的知道 frame、bounds 以及 center 之间的关系：

- frame 和 bounds 中的 size 是相同且同时变化的
- 当子控件的左上角（即原点）与其父控件为同一点时，frame 和 bounds 是相同的
- frame 中的原点为当前控件在父控件中的坐标
- bounds 中的原点为当前控件在其以自身为准的坐标系中的坐标，默认为 (0, 0)
- center 为 frame 的中心，即相对于父控件

### 应用

验证了概念，也大致了解了 frame 和 bounds 的区别，那么在实际应用中又有什么差别呢？在 Demo 的基础上，新增了下方的一个 UIView，背景色为 Light Gray（如控件层次图中蓝色选中的视图）。并在该 UIView 中嵌套了一个子控件，即棕色的 UILabel。在该棕色 UILabel 中，又使用代码创建了子控件 UIView，并将其初始化为 `UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))`，且背景为黑色。

![Demo](http://upload-images.jianshu.io/upload_images/227002-1596487dd1062c90.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![控件层次](http://upload-images.jianshu.io/upload_images/227002-1525f3d2dbeae40e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

为了方便演示，在棕色 UILabel 上方加上了一个 UISegmentedControl，用来快速切换设置的不同属性，以方便比较。默认即初始状态为：黑色控件、棕色 Label、浅灰控件三者的原点统一。

#### Bounds

当点选 Bounds，设置棕色 Label 的 bounds 原点：

```swift
brownLabel.bounds.origin = CGPoint(x: -20, y: -20)
```

虽然原点变化了，但是该控件的位置并没有发生改变，这是因为 bounds 以自身为参照，仅仅把原点坐标改变，不会影响自身。但是我们添加到该控件内部的黑色控件，就会发生偏移。偏移的动画如下图所示：

![改变 bounds](http://upload-images.jianshu.io/upload_images/227002-773b996550991770.gif?imageMogr2/auto-orient/strip)

#### Frame

当点选 Frame，设置棕色 Label 的 frame 原点：

```swift
brownLabel.frame.origin = CGPoint(x: -20, y: -20)
```

由于 frame 是参照父控件，所以一旦更改原点，那么棕色控件本身就会发生偏移。而其内部的子控件是按照其父控件定位的，所以也会跟着偏移，但相对棕色控件的位置不变。

![改变 frame](http://upload-images.jianshu.io/upload_images/227002-f15def853466add5.gif?imageMogr2/auto-orient/strip)

## 总结

bounds 和 frame 其实是 iOS 开发中很基本的知识点，但有时会对初学者造成困惑。背诵概念是很容易忘记的，通过实际的代码和 Demo 才能对知识掌握更加清晰、牢靠。

## 参考资料

- [frame - Apple Inc.](https://developer.apple.com/reference/uikit/uiview/1622621-frame)
- [center - Apple Inc.](https://developer.apple.com/reference/uikit/uiview/1622627-center)
- [bounds - Apple Inc.](https://developer.apple.com/reference/uikit/uiview/1622580-bounds)

## LICENSE

MIT
