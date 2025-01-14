//
//  Key.swift
//  TransposeMusicXML
//
//  Created by Kei Takashima on 13/01/2025.
//

import Foundation

public struct Key: Codable {
    private var fifths: Int
    
    public static let c_major = Key(fifths: 0)
    public static let a_minor = c_major
    
    // sharp keys
    public static let g_major = Key(fifths: 1)
    public static let e_minor = g_major
    
    public static let d_major = Key(fifths: 2)
    public static let b_minor = d_major
    
    public static let a_major = Key(fifths: 3)
    public static let f_sharp_minor = a_major
    
    public static let e_major = Key(fifths: 4)
    public static let c_sharp_minor = e_major
    
    public static let b_major = Key(fifths: 5)
    public static let g_sharp_minor = b_major
    
    public static let f_sharp_major = Key(fifths: 6)
    public static let d_sharp_minor = f_sharp_major

    public static let c_sharp_major = Key(fifths: 7)
    public static let a_sharp_minor = c_sharp_major

    // flat keys
    public static let f_major = Key(fifths: -1)
    public static let d_minor = f_major

    public static let b_flat_major = Key(fifths: -2)
    public static let g_minor = b_flat_major

    public static let e_flat_major = Key(fifths: -3)
    public static let c_minor = e_flat_major

    public static let a_flat_major = Key(fifths: -4)
    public static let f_minor = a_flat_major

    public static let d_flat_major = Key(fifths: -5)
    public static let b_flat_minor = d_flat_major

    public static let g_flat_major = Key(fifths: -6)
    public static let e_flat_minor = g_flat_major

    public static let c_flat_major = Key(fifths: -7)
    public static let a_flat_minor = c_flat_major

    private init(fifths: Int) {
        self.fifths = fifths
    }
    
    var fifth: Int {
        self.fifths
    }
}
