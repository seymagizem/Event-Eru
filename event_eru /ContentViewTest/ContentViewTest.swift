//
//  ContentViewTest.swift
//  ContentViewTest
//
//  Created by şeyma gizem sivri on 2.01.2025.
//

import XCTest

class DataFetcher {
    private var cache: String?

    func fetchData() async -> String {

        if let cachedData = cache {
            return cachedData
        }

        let fetchedData = "Test data"
        cache = fetchedData
        return fetchedData
    }
}

class ContentViewTest: XCTestCase {


    func testFetchData() async throws {
        let dataFetcher = DataFetcher()
        let result = await dataFetcher.fetchData()
        XCTAssertEqual(result, "Test data", "Veri beklenen şekilde alınamadı.")
    }

    func testCacheUsage() async throws {
        let dataFetcher = DataFetcher()


        let firstResult = await dataFetcher.fetchData()

        let secondResult = await dataFetcher.fetchData()

        XCTAssertEqual(firstResult, secondResult, "Veri cache'den alınmadı")
    }
}
