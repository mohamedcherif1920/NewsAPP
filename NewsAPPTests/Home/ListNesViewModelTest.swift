//
//  ListNesViewModelTest.swift
//  NewsAPPTests
//
//  Created by mohammed on 21/01/2024.
//

import XCTest
@testable import NewsAPP

class ListNewsViewModelTest: XCTestCase {
    var sut: ListViewViewModel!
    var mockedListViewUseCase: MokedListViewUseCase!

    override func setUp() {
        super.setUp()
        mockedListViewUseCase = MokedListViewUseCase()
        sut = ListViewViewModel(useCase: mockedListViewUseCase, coordinator: nil)
        
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        mockedListViewUseCase = nil
    }
     
    func testExecute() async throws {
        sut.fetchData()
        try await Task.sleep(nanoseconds: 3_000_000_000)

        XCTAssertTrue(mockedListViewUseCase.executeIsCalled)
        
        switch sut.state {
        case .success(let posts):
            XCTAssertEqual(posts.count, 1)
        default:
            XCTFail("Expected state to be .success, but found \(sut.state)")
        }
    }
}
