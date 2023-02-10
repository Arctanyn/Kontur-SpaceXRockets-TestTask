//
//  RocketHeaderCellViewModel.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

struct RocketHeaderCellViewModel {
    let rocketName: String
    let imageURL: String
    
    func fetchImage() async -> UIImage? {
        guard
            let url = URL(string: imageURL),
            let data = try? Data(contentsOf: url)
        else { return nil }
        return UIImage(data: data)
    }
}
