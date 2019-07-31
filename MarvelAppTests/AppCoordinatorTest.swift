//
//  AppCoordinatorTest.swift
//  MarvelAppTests
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Quick
import Nimble

@testable import MarvelApp

class AppCoordinatorTest: QuickSpec {
    override func spec() {
        var sut: AppCoordinator!
        
        beforeEach {
            sut = AppCoordinator(window: UIWindow(frame: UIScreen.main.bounds))
        }
        
        context("when AppCoordinator has been initialized") {
            it("identifier should not be nil or empty") {
                expect(sut.identifier).notTo(beNil())
                expect(sut.identifier).notTo(beEmpty())
            }
        }
    }
}
