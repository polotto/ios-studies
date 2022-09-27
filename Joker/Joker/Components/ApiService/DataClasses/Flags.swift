//
//  Flags.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

struct Flags: Codable {
    let nsfw, religious, political, racist: Bool
    let sexist, explicit: Bool
}
