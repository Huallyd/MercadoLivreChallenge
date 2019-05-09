//
//  BaseRobot.swift
//  MercadoLivreChallengeTests
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import UIKit
import KIF

@testable import MercadoLivreChallenge

class BaseRobot {
    var controllerSpec: BaseTest!
    var tester: KIFUITestActor { return controllerSpec.tester }

    init(controllerSpec: BaseTest) {
        self.controllerSpec = controllerSpec
    }
}
