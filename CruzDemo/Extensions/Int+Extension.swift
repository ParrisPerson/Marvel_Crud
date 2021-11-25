//
//  Int+Extension.swift
//   
//
//   
//

import Foundation

extension Int {
    func degreesToRads() -> Double {
        return (Double(self) * .pi / 180)
    }
    
    func secondsToHoursMinutesSecond () -> (Int, Int, Int) {
      return (self / 3600, (self % 3600) / 60, (self % 3600) % 60)
    }
}
