//
//  IntervalCalculator.swift
//  TransposeMusicXML
//
//  Created by Kei Takashima on 08/01/2025.
//

import Foundation

func calculateInterval(from start: Pitch, to end: Pitch) -> Interval {
    .majorSecond
}


//func up(from: Pitch, interval: Interval) -> Pitch {
func up(from: Pitch, interval: Interval) throws -> Pitch {
    try from.up(interval: interval)
}
