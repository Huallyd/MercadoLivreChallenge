//
//  Quick+KIF.swift
//  MercadoLivreChallengeTests
//
//  Created by Huallyd Smadi on 08/05/19.
//  Copyright © 2019 Huallyd Smadi. All rights reserved.
//

import KIF
import Quick

@testable import MercadoLivreChallenge

extension QuickSpec {
    public var tester: KIFUITestActor { return tester() }
    public var viewTester: KIFUIViewTestActor { return viewTester() }
    public var system: KIFSystemTestActor { return system() }

    private func viewTester(_ file: String = #file, _ line: Int = #line) -> KIFUIViewTestActor {
        return KIFUIViewTestActor(inFile: file, atLine: line, delegate: self)
    }

    private func tester(file: String = #file, _ line: Int = #line) -> KIFUITestActor {
        KIFEnableAccessibility()
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }

    private func system(file: String = #file, _ line: Int = #line) -> KIFSystemTestActor {
        KIFEnableAccessibility()
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
