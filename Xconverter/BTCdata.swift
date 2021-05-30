//
//  BTCdata.swift
//  Xconverter
//
//  Created by Sem Moolenschot on 5/30/21.
//

import Foundation

struct BTCdata: Codable {
    let buy: Double
    let symbol: String
}

typealias Bitcoin = [String: BTCdata]
