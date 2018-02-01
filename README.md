WallClock
================

[![Build Status](https://travis-ci.org/falcon283/WallClock.svg?branch=master)](https://travis-ci.org/falcon283/WallClock)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/WallClock.svg?style=flat)](http://cocoapods.org/pods/WallClock)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/WallClock.svg?style=flat)](http://cocoapods.org/pods/WallClock)
[![Swift Version](https://img.shields.io/badge/Swift-4-F16D39.svg?style=flat)](https://developer.apple.com/swift)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/falcon283/WallClock/blob/master/LICENSE)

WallClock is small framework contains structures suitable for tracking clock progress. It does not take into account the dates.

## Description

The main purpose of WallClock is to deal easily with clock units. You can sum or subtract WallClock and compare them.
It does not take into account the dates and it's by design. If you are going to compare two distinct clocks in order to say which one
is displaying an earlier time you don't need to know the date. You can compare them in an absolute way due to a clock is something
that take into account 24 * 3600 seconds. If you think about the clock as a flat timeline and a specific time a point onto the timeline,
then you can compare them in an absolute way.

### Getting Started Base

```
let midnight = WallClock.midnight
let clock = WallClock(hours: ClockHours(23), minutes: ClockMinutes(12), seconds: ClockSeconds(45))
let test1 = WallClock(0) == midnight
let test2 = midnight < clock
```

## Installing

###### CocoaPod
`pod 'WallClock'`

###### Carthage
`github "falcon283/WallClock"`

## Authors

* **Gabriele Trabucco**

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
