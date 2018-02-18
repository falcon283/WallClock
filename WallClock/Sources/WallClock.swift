//
//  WallClock.swift
//  WallClock
//
//  Created by Gabriele Trabucco on 01/02/2018.
//  Copyright © 2018 Gabriele Trabucco. All rights reserved.
//

import Foundation

public extension WallClock {

    static var midnight: WallClock {
        return WallClock()
    }

    static var noon: WallClock {
        return WallClock(hours: 12)
    }

    static var anHour: WallClock {
        return WallClock(hours: 1)
    }

    static var halfNHour: WallClock {
        return WallClock(minutes: 30)
    }

    static var quarterNHour: WallClock {
        return WallClock(minutes: 15)
    }

    static func now() -> WallClock {
        return Date().wallClock()
    }
}

public extension WallClock {

    var timeInterval: TimeInterval {
        return _hours.timeInterval + _minutes.timeInterval + _seconds.timeInterval
    }

    init(from timeInterval: TimeInterval) {
        var t = ClockUnit(timeInterval) % (24 * 3600)
        t = t < 0 ? t + (24 * 3600) : t
        _seconds = ClockSecond(t)
        _minutes = ClockMinute(t / 60)
        _hours = ClockHour(t / 3600)
    }

    func timeIntervalTo(_ wallClock: WallClock) -> TimeInterval {
        return wallClock > self ? wallClock.timeInterval - self.timeInterval : wallClock.timeInterval - self.timeInterval + 24 * 3600
    }
}

public extension Date {

    func wallClock() -> WallClock {
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: self)
        return WallClock(hours: ClockUnit(components.hour!), minutes: ClockUnit(components.minute!), seconds: ClockUnit(components.second!))
    }
}
