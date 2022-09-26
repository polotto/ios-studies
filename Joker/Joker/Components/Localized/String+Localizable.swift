//
//  String+Localizable.swift
//  Joker
//
//  Created by Angelo Polotto on 26/09/22.
//

import Foundation

extension String {
    func localized(_ resourceFile: String) -> String {
        return NSLocalizedString(self, tableName: resourceFile, bundle: Bundle.main, value: String(), comment: String())
    }
}
