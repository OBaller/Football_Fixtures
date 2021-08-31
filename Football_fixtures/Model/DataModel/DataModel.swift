
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct DataModel: Codable {
    let count: Int
    let filters: Filters
    let matches: [Match]
}

// MARK: - Filters
struct Filters: Codable {
    let dateFrom, dateTo, permission: String?
}

// MARK: - Match
struct Match: Codable {
    let id: Int?
    let competition: Competition
    let season: Season
    let utcDate: String
    let status: Status
    let matchday: Int
    let stage: Stage
    let group: JSONNull?
    let lastUpdated: String
    let odds: Odds
    let score: Score
    let homeTeam, awayTeam: Team
    let referees: [Referee]
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let name: String
}

// MARK: - Competition
//struct Competition: Codable {
//    let id: Int
//    let name: String
//    let area: Area
//}

// MARK: - Area
struct Area: Codable {
    let name: String
    let code: String?
    let ensignURL: String?

    enum CodingKeys: String, CodingKey {
        case name
        case code
        case ensignURL = "ensignUrl"
    }
}

//enum Name: String, Codable {
//    case australia = "Australia"
//    case brazil = "Brazil"
//    case england = "England"
//    case france = "France"
//    case germany = "Germany"
//    case italy = "Italy"
//    case netherlands = "Netherlands"
//    case portugal = "Portugal"
//    case spain = "Spain"
//    case africa = "Africa"
//    case argentina = "Argentina"
//}

// MARK: - Odds
struct Odds: Codable {
    let msg: Msg
}

enum Msg: String, Codable {
    case activateOddsPackageInUserPanelToRetrieveOdds = "Activate Odds-Package in User-Panel to retrieve odds."
}

// MARK: - Referee
struct Referee: Codable {
    let id: Int
    let name: String
    let role: Role
    let nationality: String?
}

enum Role: String, Codable {
    case assistantRefereeN1 = "ASSISTANT_REFEREE_N1"
    case assistantRefereeN2 = "ASSISTANT_REFEREE_N2"
    case fourthOfficial = "FOURTH_OFFICIAL"
    case referee = "REFEREE"
    case videoAssisantRefereeN1 = "VIDEO_ASSISANT_REFEREE_N1"
    case videoAssisantRefereeN2 = "VIDEO_ASSISANT_REFEREE_N2"
}

// MARK: - Score
struct Score: Codable {
    let winner: Winner?
    let duration: Duration
    let fullTime, halfTime, extraTime, penalties: ExtraTime
}

enum Duration: String, Codable {
    case regular = "REGULAR"
}

// MARK: - ExtraTime
struct ExtraTime: Codable {
    let homeTeam, awayTeam: Int?
}

enum Winner: String, Codable {
    case awayTeam = "AWAY_TEAM"
    case draw = "DRAW"
    case homeTeam = "HOME_TEAM"
}

// MARK: - Season
struct Season: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int
    let winner: JSONNull?
}

enum Stage: String, Codable {
    case regularSeason = "REGULAR_SEASON"
}

enum Status: String, Codable {
    case finished = "FINISHED"
    case inPlay = "IN_PLAY"
    case paused = "PAUSED"
    case scheduled = "SCHEDULED"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
