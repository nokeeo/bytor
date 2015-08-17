# Bytor
A CSS like styling language for iOS.

## Installation
1. Navigate to project directory
2. Run **git submodule add https://github.com/nokeeo/bytor**
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

## Features
Bytor follows basic CSS syntax with a few exceptions and added functionality.  This section highlights those differences.

### Variables
Bytor supports variables. All variable type checking is done at runtime. Any type check errors will appear when the style is trying to be applied to a view. Variables names can be alphanumeric however must start with a letter. A variable assignment looks like the following:
```
exampleString = "Snowdog";
exampleColor = #FFFFFF;
```

### Super Styles
Allows another style to inherit from another style.  The parent style must be declared before the child. The child can override any of the parents properties. A child can also inherit from multiple parents. The parents listed first will override any properties of any following parents.
```
superStyle1 {
  background-color: #0498C9;
}

superStyle2 {
  opacity: .75;
}

childStyle | superStyle1, superStyle2 {
  border-width: 2;
  border-color: #FFFFF;
}
```

### Types:
- Numbers (2112, 2.5, .75, 0.75)
- Strings ("this is a string")
- Hex Color (#FFFFFF)

Some properties call for multiple values.  The values are simply separated by spaces.

## Supported Properties
### UIView
- opacity (Number)
- background-color (Color)
- border-width (Number)
- border-color (Color)
- border-radius (Number)
- tint-color (Color)
- shadow-color (Color)
- shadow-opacity (Number)
- shadow-radius (Number)
- shadow-offset: width (Number) height (Number)

### UITextField
- font (String)
- text-size (Number)
- min-text-size (Number)
- text-color (Color)
- text-alignment (String)(left, center, right, justified, natural)
- border-style (String)(solid, bezel, round, none)
- background-image (String)

### UILabel
- font (String)
- text-size (Number)
- text-align (String)(left, center, right, justified, natural)
- text-color (Color)

### UIControl
- h-align (String)(center, right, left, fill)
- v-align (String)(center, bottom, top, fill)

### UIButton
- text-color (Color)
- text-color-highlighted (Color)
- text-color-disabled (Color)
- text-color-selected (Color)
- text-shadow-color (Color)
- text-shadow-color-highlighted (Color)
- text-shadow-color-disabled (Color)
- text-shadow-color-selected (Color)
- padding: top (Number) left (Number) bottom (Number) right (Number)
- title-padding: top (Number) left (Number) bottom (Number) right (Number)
- image-padding: top (Number) left (Number) bottom (Number) right (Number)
- image (String)
- image-highlighted (String)
- image-disabled (String)
- image-selected (String)
- background-image (String)
- background-image-highlighted (String)
- background-image-disabled (String)
- background-image-selected (String)

**Further support for other UIView subclasses in future releases. If you want to see specific functionality create an issue.** 
