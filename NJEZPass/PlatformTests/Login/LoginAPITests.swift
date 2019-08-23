//
//  LoginAPITests.swift
//  ECCTests
//
//  Created by Gudavarthi, Pardhu on 17/08/19.
//  Copyright © 2019 Conduent. All rights reserved.
//

import XCTest
import Domain
import Entities
@testable import Platform

class LoginAPITests: XCTestCase {
    
    var loginResponse : LoginModel.Response?
    var errorResponse : APIError?
    var responseExpectation : XCTestExpectation?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        loginResponse = nil
        errorResponse = nil
        responseExpectation = nil
    }

    func test_Login_API_Success(){
        responseExpectation = expectation(description: "login success")
        let provider = LoginUsecaseProvider()
        let usecase = provider.provideLoginUsecase(requestType: .remote, handler: self)
        
        var requestModal = LoginModel.Request ()
        requestModal.userName = "peapods"
        requestModal.password = "Welcome1"
        usecase.login(request: requestModal)
        waitForExpectations(timeout: 10) { (_) in
            XCTAssertNotNil(self.loginResponse)
        }
    }
    
    func test_login_API_Fail(){
        responseExpectation = expectation(description: "login fail")
        let provider = LoginUsecaseProvider()
        let usecase = provider.provideLoginUsecase(requestType: .remote, handler: self)
        
        var requestModal = LoginModel.Request ()
        requestModal.userName = "peapods"
        requestModal.password = "welcome"
        usecase.login(request: requestModal)
        waitForExpectations(timeout: 10) { (_) in
            XCTAssertNotNil(self.errorResponse)
        }
    }
}

extension LoginAPITests : IResponseHandler {
    func onSuccess<T>(response: T) {
        if let res = response as? LoginModel.Response {
            PlatformUtility.accessToken = res.access_token
            self.loginResponse = res
        }
        responseExpectation?.fulfill()
    }
    
    func onError(err: APIError) {
        self.errorResponse = err
        responseExpectation?.fulfill()
    }
}
