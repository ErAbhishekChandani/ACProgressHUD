# ACProgressHUD
Lightweight control to show customisable Progress View in swift.

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/progressView.png)

## Features

- [x] Show Progress Hud with only one line of code.
- [x] Customize the Progress HUD appeareance.
- [x] Make global configuration for Progress HUD to show the same HUD through out the app.
- [x] Show HUD with Animations.
- [x] Show HUD with blur Background.
- [x] Change the Show and Hide Animations for HUD.
- [ ] The best is yet to come.

## Installation

#### Installation with Cocopods


<div class="highlight highlight-source-shell"><pre>pod 'ACProgressHUD-Swift', '~> 1.4' </pre></div>

#### Manual Installation

Download the Sample and drag & drop the ACProgressView.swift, ACProgressView.xib, ACProgressHUD.swift & ACHUD+Animation.swift files in your project.


## How To Use.

**1) Show Progress HUD.**

```swift
let progressView = ACProgressHUD.shared
progressView.progressText = "Please wait..."
progressView.showHUD()

OR

ACProgressHUD.shared.showHUD()


```

**2)Hide Progress HUD.**

```swift
ACProgressHUD.shared.hideHUD()
```

##ACProgressHUD + Animation

**1) Grow In - Grow Out Animation :- Show HUD with Grow In animation & dismiss HUD with Grow Out animation.** 

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/growInGrowOut.gif)

**2) Shrink In - Shrink Out Animation :- Show HUD with Shrink In animation & dismiss HUD with Shrink Out animation.**

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/shrinkInShrinkOut.gif)

**3) Bounce In - Bounce Out Animation :- Show HUD with Bounce In animation & dismiss HUD with Bounce Out animation.**

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/bounceInOUT.gif)

**4) Slide from Top - Slide To Bottom :- Show HUD sliding from top & dismiss by sliding to bottom.**

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/slideFromTop.gif)

**5) Bounce from Top - Bounce To Bottom :- Show HUD sliding from top & dismiss by sliding to bottom with bounce animation.**

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/bounceTopToBottom.gif)

**6) Zoom In Out - Fade :- Show HUD with zoom in out animation & dismiss with fade animation.**

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/zoomINOut.gif)

**7) Show HUD with transparent background.**

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/enableBackground.gif)

**8) Show HUD with Blur background.**

![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/blurBackground.gif)

## ACPRogressHUD Configuration

**1) Configurate ACProgressHUD once anywhere in app with following method.**

```swift

ACProgressHUD.shared.configureACProgressHudStyle(withProgressText: "Hey Please wait..",hudBackgroundColor: UIColor.white, shadowColor: UIColor.black, shadowRadius: 10, cornerRadius: 5, indicatorColor: UIColor.blue, enableBackground: false, backgroundColor: UIColor.black, backgroundColorAlpha: 0.3, enableBlurBackground: false,showHudAnimation: .growIn,dismissHudAnimation: .growOut)

```

**2) Change progress HUD text.**

```swift

ACProgressHUD.shared.progressText = "Please wait..."

```
**3) Change progress HUD Shadow Color.**

```swift

ACProgressHUD.shared.shadowColor = .black

```
**4) Change progress HUD Shadow Radius.**

```swift

ACProgressHUD.shared.shadowRadius = 10.0

```

**5) Change HUD Corner Radius.**

```swift

ACProgressHUD.shared.cornerRadius = 10.0

```
**6) Change HUD Indicator Color.**

```swift

ACProgressHUD.shared.indicatorColor = .black

```
**7) Change HUD Background color.**

```swift

ACProgressHUD.shared.hudBackgroundColor = .black

```
**8) Show or hide Dim background when Progress View is shown.**

```swift

ACProgressHUD.shared.enableBackground = true

```
**9) Show or hide Blur background when Progress View is shown.**

```swift

ACProgressHUD.shared.enableBlurBackground = true

```
**10) Show or hide Blur background when Progress View is shown.**

```swift

ACProgressHUD.shared.blurBackgroundColor = true

```

**11) Select HUD show animation.**

```swift

ACProgressHUD.shared.showHudAnimation = .growIn

```
**12) Select HUD Dismiss animation.**

```swift

ACProgressHUD.shared.dismissHudAnimation = .growOut

```
**13) Change Progress label text color.**

```swift

ACProgressHUD.shared.progressTextColor = .black

```


## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**,please submit a pull request.

## License
ACProgressHUD is released under the MIT license. See LICENSE for details.


## ![ACProgressHUD](https://github.com/ErAbhishekChandani/ACProgressHUD/blob/master/ACProgressHUD/Example%20Assets/AC.png) A Control by Er. Abhishek Chandani
