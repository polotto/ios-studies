# ios-studies

## utils

### show hidden files
```shell script
defaults write com.apple.Finder AppleShowAllFiles true
killall Finder
```

### cocoa pod commands
- site: https://cocoapods.org/
```
# install
sudo gem install cocoapods

# start pod on project
pod init

# install pods
pod install

# cache clean
pod cache clean
```
## ways to make view
- SwiftUI
- Xib
- StoryBoard

## architectures
- VIPER
- MVP

## Tutorial
- 

## Tips

### MacOS shortcuts
- cmd + ` : alternate between same app windows
- cmd + TAB : alternate between apps

### XCode tips
- https://www.youtube.com/watch?v=1uVnWbygg_c&feature=youtu.be
- https://www.youtube.com/watch?v=38LNXk_oTak&feature=youtu.be
- https://supereasyapps.com/blog/2014/9/15/14-xcode-time-saving-shortcuts-memorize-and-improve-your-productivity
- https://medium.com/@gabriel_lewis/tips-to-improve-your-xcode-workflow-9c2bdda1b26f
- fix XCode odd errors: https://github.com/codepath/ios_guides/wiki/Fixing-Xcode

### track build times
```
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES
```

### function name place holder
˜˜˜swift
func <#name#> () {
    print("something")
}
˜˜˜

### warning/error message pattern
˜˜˜swift
// allow compile
#warning("example of a message")

// don't allow compile
#error("some error")
˜˜˜

### pring var debug in lldb
˜˜˜
po yourVariable
˜˜˜

### xcode shortcuts
- cmd + R : run
- cmd + B : build
- cmd + shift + K : clean

- cmd + T : tabs

- cmd + shift + L : library
- cmd + option + shift + L : library fixed

- ctrl + shift + click : multi cursor
- option + drag : vertical selection

- cmd + shift + F : find navigator

- cmd + 0(zero) : show/hide left panel
- cmd + 1...9 : navigate left panel

- cmd + option + 0(zero) : show/hide right panel
- cmd + option + 1...4 : navigate right panel

- ctrl + 6 : file jump method/variable

- cmd + shift + O : open file quickly

- cmd + option + A : add file to the project

- cmd + D : duplicate element
- cmd + = : resize UI(Button|Label) element to fit the text inside

- cmd + click : action: rename

- cmd + shift + 0(zero) : documentation and reference

- cmd + O : open project/file

- cmd + shift + N : new project

- ctrl + cmd + j : jump to Definition
- ctrl + cmd + Forward Arrow or Ctrl + Command + Back Arrow : back and forward
- ctrl + cmd + ' : auto fix next error
- ctrl + cmd + " : auto fix prev error

## Swift

### null check
- https://stackoverflow.com/questions/54966200/does-swift-have-standard-scope-functions-like-in-kotlin

#### extension
```swift
extension Optional {
    func `let`(do: (Wrapped)->()) {
        guard let v = self else { return }
        `do`(v)
    }
}

var str: String? = "text"
str.let {
    print( $0 ) // prints `text`
}
str = nil

str.let {
    print( $0 ) // not executed if str == nil
}
```

#### map
```swift
// prints 123
let str1 : String? = "123"
str1.map { print($0) }

// doesn't print anything
let str2 : String? = nil
str2.map { print($0) }
```

#### idiomatic
```swift
var str: String? = "123"
if let s = str { 
    print(s) 
}

let str2: String? = "123"
guard let strUnwrapped = str2 else { return }
```

## Size classes

![iPhone](./img/size-classes-iphone.png)

![iPad](./img/size-classes-ipad.png)

![iPad multitasking](./img/size-classes-ipad-multitasking.png)

![XCode](./img/size-classes-xcode.png)


## Content hugging and compression

![Content hugging and compression](./img/content-hugging-and-compression.png)
