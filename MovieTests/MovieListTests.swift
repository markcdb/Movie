//
//  MovieTests.swift
//  MovieTests
//
//  Created by Mark Christian Buot on 10/07/2019.
//  Copyright © 2019 Mark Christian Buot. All rights reserved.
//

import XCTest
@testable import Movie

enum TestCase: Equatable {
    
    case listRequest
    case pageRequest(Bool)
    
    static func == (lhs: TestCase, rhs: TestCase) -> Bool {
        
        switch (lhs, rhs) {
        case (.listRequest, .listRequest):
            return true
        case (.pageRequest(_), .pageRequest(_)):
            return true
        default:
            return false
        }
    }

    var rawValue: String {
        switch self {
        case .listRequest:
            return "listRequest"
        default:
            return "pageRequest"
        }
    }
}

class MovieListTests: XCTestCase {

    
    var testCase: TestCase?
    var expectation: XCTestExpectation?
    var viewModel: MovieListViewModel?
    var api: MockMovieRepository?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = GlobalVMFactory.createMovieListVM(repository: api,
                                                      delegate: self)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListRequest() {
        testCase    = .listRequest
        expectation = XCTestExpectation(description: "")
        viewModel?.request()
        
        wait(for: [expectation!],
             timeout: 10.0)
    }
    
    func testListRequestPaging() {
        testCase    = .pageRequest(false)
        expectation = XCTestExpectation(description: testCase?.rawValue ?? "")
        viewModel?.request()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.viewModel?.request()
            self.testCase    = .pageRequest(true)
        }
        
        wait(for: [expectation!],
             timeout: 10.0)
    }
}

extension MovieListTests: BaseVMDelegate {
    
    func didUpdateModel(_ viewModel: BaseVM,
                        withState viewState: ViewState) {
        if viewState == .success(nil) {
            switch testCase {
            case .listRequest?:
                expectation?.fulfill()
            case .pageRequest(let isComplete)?:
                if isComplete == true,
                    (self.viewModel?.movies.count ?? 0) > 20 {
                    expectation?.fulfill()
                }
            default:
                break
            }
        }
    }
}
