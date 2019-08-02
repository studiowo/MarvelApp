//
//  MarvelListViewModelTest.swift
//  MarvelAppTests
//
//  Created by Renato Matos de Paula on 25/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Quick
import Nimble
import SDK

@testable import MarvelApp

class MarvelListViewModelTest: QuickSpec, ViewModelAccess {
    override func spec() {
        var sut: MarvelListViewModelStub!
        
        beforeEach {
            sut = MarvelListViewModelStub(with: JSONHelper.getObjectFrom(json: "heroesList", type: HeroeList.self)!)
            sut.fetchHeroes()
        }
        
        context("when start MarvelListViewModelStub and fetch heroes") {
            it("should set model correctly with HeroeList object") {
                expect(sut.getModel(self)).notTo(beNil())
            }
            
            it("should title return Marvel Heroes") {
                expect(sut.title) == "Marvel Heroes"
            }
        }
    }
}
