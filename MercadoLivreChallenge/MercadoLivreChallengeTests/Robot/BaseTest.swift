//
//  BaseTest.swift
//  MercadoLivreChallengeTests
//
//  Created by Huallyd Smadi on 09/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import Quick
import Nimble
import UIKit

class BaseTest: QuickSpec {
    var rootViewController: UIViewController? {
        didSet {
            if let _ = rootViewController {
                loadRootViewController()
            }
        }
    }

    private func loadRootViewController() {
        UIApplication.shared.keyWindow!.rootViewController = rootViewController
        UIApplication.shared.keyWindow!.makeKeyAndVisible()
    }
}
