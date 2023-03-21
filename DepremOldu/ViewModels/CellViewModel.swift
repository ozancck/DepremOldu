//
//  CellViewModel.swift
//  DepremOldu
//
//  Created by Ozan Çiçek on 21.03.2023.
//

import Foundation

class CellViewModel: ObservableObject {
    func splitText(param: String) -> String {
        let components = param.split(separator: "(")
        guard components.count > 1 else { return param }

        let result = components[1].split(separator: ")")[0].trimmingCharacters(in: .whitespaces)
        if let result = Optional(result) {
            return result
        } else {
            return ""
        }
    }
}
