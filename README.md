# Bytor
A CSS like programming language for iOS.

## Installation
1. Navigate to project directory
2. Run git submodule add https://github.com/nokeeo/bytor
3. Open project directory in Finder
4. Drag the Bytor project file into your project file
5. Build the Bytor Project
6. Under Linked Frameworks and Libraries add Bytor.framework

8. In the app delegate add the following code:

Import:
```Objective-C
#import <Bytor/Bytor.h>
```

In didFinishLaunching:
```Objective-C
NSString *filePath = [[NSBundle mainBundle] pathForResource: @"example" ofType: @"bytor"];
[[BYBytor sharedInstance] stylesFromFilePath: filePath];
```

## Applying Styles
Styles can be applied to any UIView. First import the Bytor Framework. After run the following code on any view:
```Objective-C
[view setStyle: @"styleName"]
```
