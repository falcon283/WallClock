//
//  ClockUnits.swift
//  WallClock
//
//  Created by Gabriele Trabucco on 03/02/2018.
//  Copyright © 2018 Gabriele Trabucco. All rights reserved.
//

import Foundation

/// The unit of the
public typealias ClockUnit = Int32

struct ClockSecond: Equatable, Comparable {

    let value: ClockUnit

    init(_ seconds: ClockUnit) {
        let s = seconds % 60
        value = s < 0 ? s + 60 : s
    }

    var timeInterval: TimeInterval {
        return TimeInterval(value)
    }

    static func == (lhs: ClockSecond, rhs: ClockSecond) -> Bool {
        return lhs.value == rhs.value
    }

    static func < (lhs: ClockSecond, rhs: ClockSecond) -> Bool {
        return lhs.value < rhs.value
    }
}

struct ClockMinute: Equatable, Comparable {

    let value: ClockUnit

    init(_ minutes: ClockUnit) {
        let m = minutes % 60
        value = m < 0 ? m + 60 : m
    }

    var timeInterval: TimeInterval {
        return TimeInterval(value * 60)
    }

    static func == (lhs: ClockMinute, rhs: ClockMinute) -> Bool {
        return lhs.value == rhs.value
    }

    static func < (lhs: ClockMinute, rhs: ClockMinute) -> Bool {
        return lhs.value < rhs.value
    }
}

struct ClockHour: Equatable, Comparable {

    let value: ClockUnit

    init(_ hours: ClockUnit) {
        let h = hours % 24
        value = h < 0 ? h + 24 : h
    }

    var timeInterval: TimeInterval {
        return TimeInterval(value * 3600)
    }

    static func == (lhs: ClockHour, rhs: ClockHour) -> Bool {
        return lhs.value == rhs.value
    }

    static func < (lhs: ClockHour, rhs: ClockHour) -> Bool {
        return lhs.value < rhs.value
    }
}

public struct WallClock: Equatable, Comparable {

    let _hours: ClockHour
    let _minutes: ClockMinute
    let _seconds: ClockSecond

    public var hours: ClockUnit {
        return _hours.value
    }

    public var minutes: ClockUnit {
        return _minutes.value
    }

    public var seconds: ClockUnit {
        return _seconds.value
    }

    public init(hours: ClockUnit = 0, minutes: ClockUnit = 0, seconds: ClockUnit = 0) {
        let s = ClockSecond(seconds)
        let m = ClockMinute(minutes)
        let h = ClockHour(hours)

        _hours = h
        _minutes = m
        _seconds = s
    }

    // Operators

    public static func == (lhs: WallClock, rhs: WallClock) -> Bool {
        return lhs.timeInterval == rhs.timeInterval
    }

    public static func < (lhs: WallClock, rhs: WallClock) -> Bool {
        return lhs.timeInterval < rhs.timeInterval
    }

    public static func + (lhs: WallClock, rhs: WallClock) -> WallClock {
        return WallClock(from: lhs.timeInterval + rhs.timeInterval)
    }

    public static func + (lhs: WallClock, rhs: TimeInterval) -> WallClock {
        return lhs + WallClock(from: rhs)
    }

    public static func - (lhs: WallClock, rhs: WallClock) -> WallClock {
        return WallClock(from: lhs.timeInterval - rhs.timeInterval)
    }

    public static func - (lhs: WallClock, rhs: TimeInterval) -> WallClock {
        return lhs - WallClock(from: rhs)
    }
}
