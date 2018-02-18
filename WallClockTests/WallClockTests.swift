//
//  WallClockTests.swift
//  WallClockTests
//
//  Created by Gabriele Trabucco on 01/02/2018.
//  Copyright © 2018 Gabriele Trabucco. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import WallClock

class WallClockTests: QuickSpec {
    
    override func spec() {

        describe("ClockUnit") {

            describe("Seconds") {

                context("When creating inbound") {

                    let s = ClockSecond(10)

                    it("Should have valid number of seconds") {
                        expect(s.value) == 10
                    }
                }

                context("When creating positive outbound") {

                    let s1 = ClockSecond(3600 + 60 + 1)
                    let s2 = ClockSecond(24 * 3600)

                    it("Should have valid number of seconds") {
                        expect(s1.value) == 1
                        expect(s2.value) == 0
                    }
                }

                context("When creating negative outbound") {

                    let s1 = ClockSecond(-3600 - 60 - 1)
                    let s2 = ClockSecond(-24 * 3600)

                    it("Should have valid number of seconds") {
                        expect(s1.value) == 59
                        expect(s2.value) == 0
                    }
                }

                context("When comparing seconds") {

                    let s1 = ClockSecond(12)
                    let s2 = ClockSecond(45)
                    let s3 = ClockSecond(72)

                    let r1 = s1 < s2
                    let r2 = s1 == s3

                    it("Should have valid result") {
                        expect(r1) == true
                        expect(r2) == true
                    }
                }
            }

            describe("Minutes") {

                context("When creating inbound") {

                    let s = ClockMinute(10)

                    it("Should have valid number of minutes") {
                        expect(s.value) == 10
                    }
                }

                context("When creating positive outbound") {

                    let s1 = ClockMinute(60 + 1)
                    let s2 = ClockMinute(24 * 60)

                    it("Should have valid number of minutes") {
                        expect(s1.value) == 1
                        expect(s2.value) == 0
                    }
                }

                context("When creating negative outbound") {

                    let s1 = ClockMinute(-60 - 1)
                    let s2 = ClockMinute(-24 * 60)

                    it("Should have valid number of minutes") {
                        expect(s1.value) == 59
                        expect(s2.value) == 0
                    }
                }

                context("When comparing minutes") {

                    let s1 = ClockMinute(12)
                    let s2 = ClockMinute(45)
                    let s3 = ClockMinute(72)

                    let r1 = s1 < s2
                    let r2 = s1 == s3

                    it("Should have valid result") {
                        expect(r1) == true
                        expect(r2) == true
                    }
                }
            }

            describe("Hours") {

                context("When creating inbound") {

                    let s = ClockHour(10)

                    it("Should have valid number of hours") {
                        expect(s.value) == 10
                    }
                }

                context("When creating positive outbound") {

                    let s = ClockHour(24)

                    it("Should have valid number of hours") {
                        expect(s.value) == 0
                    }
                }

                context("When creating negative outbound") {

                    let s = ClockHour(-1)

                    it("Should have valid number of hours") {
                        expect(s.value) == 23
                    }
                }

                context("When comparing hours") {

                    let s1 = ClockHour(5)
                    let s2 = ClockHour(17)
                    let s3 = ClockHour(29)

                    let r1 = s1 < s2
                    let r2 = s1 == s3

                    it("Should have valid result") {
                        expect(r1) == true
                        expect(r2) == true
                    }
                }
            }
        }

        describe("WallClock") {

            context("When using the default initializer") {

                context("using inbound ranges") {

                    let w = WallClock(hours: 12, minutes: 45, seconds: 34)

                    it("should have valid values") {
                        expect(w.hours) == 12
                        expect(w.minutes) == 45
                        expect(w.seconds) == 34
                    }
                }

                context("using positive outbound ranges") {

                    let w = WallClock(hours: 24, minutes: 60, seconds: 60)

                    it("should have valid values") {
                        expect(w.hours) == 0
                        expect(w.minutes) == 0
                        expect(w.seconds) == 0
                    }
                }

                context("using negatives outbound ranges") {

                    let w = WallClock(hours: -1, minutes: -1, seconds: -1)

                    it("should have valid values") {
                        expect(w.hours) == 23
                        expect(w.minutes) == 59
                        expect(w.seconds) == 59
                    }
                }
            }

            context("When using timeInterval initializer") {

                context("with inbound ranges") {

                    let w = WallClock(from: 12*3600 + 45*60 + 34)

                    it("should have valid values") {
                        expect(w.hours) == 12
                        expect(w.minutes) == 45
                        expect(w.seconds) == 34
                    }
                }

                context("with positive outbound ranges") {

                    let w = WallClock(from: 24*3600)

                    it("should have valid values") {
                        expect(w.hours) == 0
                        expect(w.minutes) == 0
                        expect(w.seconds) == 0
                    }
                }

                context("with negatives outbound ranges") {

                    let w = WallClock(from: -1)

                    it("should have valid values") {
                        expect(w.hours) == 23
                        expect(w.minutes) == 59
                        expect(w.seconds) == 59
                    }
                }
            }

            context("When comparing WallClock") {

                let s1 = WallClock(hours: 7, minutes: 34, seconds: 34)
                let s2 = WallClock(hours: 9, minutes: 21, seconds: 12)
                let s3 = WallClock(hours: 31, minutes: 94, seconds: 154)

                let r1 = s1 < s2
                let r2 = s1 == s3

                it("Should have valid result") {
                    expect(r1) == true
                    expect(r2) == true
                }
            }

            context("When sum WallClock") {

                let s1 = WallClock(hours: 9, minutes: 21, seconds: 12)
                let s2 = WallClock(hours: 2, minutes: 34, seconds: 12)

                let r1 = s1 + s2
                let r2 = s1 - s2
                let r3 = s1 + TimeInterval(2 * 3600 + 34 * 60 + 12)
                let r4 = s1 - TimeInterval(2 * 3600 + 34 * 60 + 12)

                it("Should have valid result") {
                    expect(r1.hours) == 11
                    expect(r1.minutes) == 55
                    expect(r1.seconds) == 24
                    expect(r2.hours) == 6
                    expect(r2.minutes) == 47
                    expect(r2.seconds) == 0
                    expect(r3.hours) == 11
                    expect(r3.minutes) == 55
                    expect(r3.seconds) == 24
                    expect(r4.hours) == 6
                    expect(r4.minutes) == 47
                    expect(r4.seconds) == 0
                }
            }

            context("When creating defaults WallClock") {

                let midnight = WallClock.midnight
                let noon = WallClock.noon
                let anHour = WallClock.anHour
                let halfNHour = WallClock.halfNHour
                let quarterNHour = WallClock.quarterNHour

                it("Should have valid result") {
                    expect(midnight.hours) == 0
                    expect(midnight.minutes) == 0
                    expect(midnight.seconds) == 0
                    expect(noon.hours) == 12
                    expect(noon.minutes) == 0
                    expect(noon.seconds) == 0
                    expect(anHour.hours) == 1
                    expect(anHour.minutes) == 0
                    expect(anHour.seconds) == 0
                    expect(halfNHour.hours) == 0
                    expect(halfNHour.minutes) == 30
                    expect(halfNHour.seconds) == 0
                    expect(quarterNHour.hours) == 0
                    expect(quarterNHour.minutes) == 15
                    expect(quarterNHour.seconds) == 0
                }
            }

            context("When deriving WallClock from Date") {

                let h = 3
                let m = 34
                let s = 26

                let c = DateComponents(calendar: Calendar.current, hour: h, minute: m, second: s)
                let date = Calendar.current.date(from: c)!

                let clock = date.wallClock()

                it("Should have valid result") {
                    expect(clock.hours) == ClockUnit(h)
                    expect(clock.minutes) == ClockUnit(m)
                    expect(clock.seconds) == ClockUnit(s)
                }
            }

            context("When calculating timeIntervalTo") {

                let clock330 = WallClock(hours: 3, minutes: 30, seconds: 0)
                let clock630 = WallClock(hours: 6, minutes: 30, seconds: 0)

                it("Should have valid result") {
                    expect(clock330.timeIntervalTo(clock630)) == 3 * 3600
                    expect(clock630.timeIntervalTo(clock330)) == 21 * 3600
                }
            }
        }
    }
}
