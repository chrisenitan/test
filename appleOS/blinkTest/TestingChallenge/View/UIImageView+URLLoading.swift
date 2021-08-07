//
//  UIImageView+URLLoading.swift
//  TestingChallenge
//
//  Created by Christian Lobach on 23.11.18.
//  Copyright © 2018 Blinks Labs GmbH. All rights reserved.
//

import UIKit

extension UIImageView {

    func setImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

            DispatchQueue.main.async {
                if let data = data {
                    self?.image = UIImage(data: data)
                }
            }

        }

        task.resume()
    }
}
