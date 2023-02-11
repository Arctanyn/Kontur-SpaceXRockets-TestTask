//
//  AsyncImageView.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import UIKit

@MainActor final class AsyncImageView: UIImageView {

    //MARK: - Initialization
    
    init(url: URL?) {
        super.init(frame: .zero)
        Task {
            await fetchImage(from: url)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private methods
    
    func fetchImage(from url: URL?) async {
        guard let url else {
            self.image = nil
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            self.image = UIImage(data: data)
        } catch {
            self.image = nil
        }
    }
}
