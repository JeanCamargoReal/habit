//
//  Gender.swift
//  habit
//
//  Created by Jean Camargo on 06/02/23.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case female = "Feminino"

    var id: String {
        self.rawValue
    }
}
