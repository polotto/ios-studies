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

- cmd + D : duplicate element

- cmd + click : action: rename

- cmd + shift + 0(zero) : documentation and reference

- cmd + O : open project/file

- cmd + shift + N : new project
