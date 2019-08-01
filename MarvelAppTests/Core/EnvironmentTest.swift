//
//  EnvironmentTest.swift
//  MarvelAppTests
//
//  Created by Renato Matos de Paula on 31/07/19.
//  Copyright © 2019 Renato Matos de Paula. All rights reserved.
//

import Quick
import Nimble

@testable import MarvelApp

class EnvironmentTest: QuickSpec {
    override func spec() {
        let sut: Environment.Type = Environment.self
        
        context("when get Environment values") {
            it("baseUrl should not be nil or empty") {
                expect(sut.baseUrl).notTo(beNil())
                expect(sut.baseUrl).notTo(beEmpty())
            }
            it("baseUrl should to have a valid value") {
                expect(sut.baseUrl).to(equal("http://127.0.0.1:8080"))
            }
            
            it("publicKey should not be nil or empty") {
                expect(sut.publicKey).notTo(beNil())
                expect(sut.publicKey).notTo(beEmpty())
            }
            it("publicKey should to have a valid value") {
                expect(sut.publicKey).to(equal("d2a95c85d22946a1e4d88509f0631f0b"))
            }
            
            it("privateKey should not be nil or empty") {
                expect(sut.privateKey).notTo(beNil())
                expect(sut.privateKey).notTo(beEmpty())
            }
            it("privateKey should to have a valid value") {
                expect(sut.privateKey).to(equal("c4ba25aadb28df87ef62461afefc0c188c3f31b2"))
            }
        }
    }
}
