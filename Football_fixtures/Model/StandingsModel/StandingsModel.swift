//
//  StandingsModel.swift
//  Football_fixtures
//
//  Created by naseem on 01/09/2021.
//

import Foundation

// MARK: - Welcome
struct StandingsModel: Codable {
    let filters: Filters
    let competition: Competition
    let season: Season
    let standings: [Standing]
}

// MARK: - Competition
//struct Competition: Codable {
//    let id: Int
//    let area: Area
//    let name, code, plan: String
//    let lastUpdated: Date
//}

// MARK: - Area
//struct Area: Codable {
//    let id: Int
//    let name: String
//}

// MARK: - Filters
//struct Filters: Codable {
//}

// MARK: - Season
//struct Season: Codable {
//    let id: Int
//    let startDate, endDate: String
//    let currentMatchday: Int
//    let winner: JSONNull?
//}

// MARK: - Standing
struct Standing: Codable {
    let stage, type: String?
    let group: JSONNull?
    let table: [Table]
}

// MARK: - Table
struct Table: Codable {
    let position: Int
    let team: Team
    let playedGames: Int
    let form: JSONNull?
    let won, draw, lost, points: Int
    let goalsFor, goalsAgainst, goalDifference: Int
}

// MARK: - Team
  struct Team: Codable {
    let id: Int
    let name: String
    let crestURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case crestURL = "crestUrl"
    }
}

// MARK: - Encode/decode helpers

//private class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
