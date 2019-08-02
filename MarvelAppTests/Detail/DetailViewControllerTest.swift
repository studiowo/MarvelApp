//
//  DetailViewControllerTest.swift
//  MarvelAppTests
//
//  Created by Renato Matos de Paula on 02/08/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import SDK

@testable import MarvelApp

class DetailViewControllerTest: QuickSpec {
    override func spec() {
        var sut: DetailViewController!
        
        beforeEach {
            sut = HeroeViewControllerFactory.getDetailViewController(with: JSONHelper.getObjectFrom(json: "heroe", type: Heroe.self)!)
            WindowHelper.showInTestWindow(viewController: sut)
        }
        
        context("when present MainViewController in window") {
            it("should to have a valid snapshot") {
                self.viewTester.waitForAnimationsToFinish()
                expect(sut) == snapshot("DetailViewController")
            }
        }
    }
}
