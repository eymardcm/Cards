//
//  CardModel.swift
//  Cards
//
//  Created by Chad Eymard on 3/18/24.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    let title: String
    let headline: String
    let imageName: String
    let callToAction: String
    let message: String
    let gradientColors: [Color]
}
