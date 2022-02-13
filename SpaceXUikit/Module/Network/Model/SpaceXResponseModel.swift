
import Foundation

// MARK: - SpaceXResponseModel
struct SpaceXResponseModel: Codable {
    let links: Links?
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let tdb, net: Bool?
    let window: Int?
    let rocket: String?
    let success: Bool?
    let details: String?
    let crew, ships, capsules, payloads: [String]?
    let launchpad: String?
    let autoUpdate: Bool?
    let flightNumber: Int?
    let name, dateUTC: String?
    let dateUnix: Int?
    let dateLocal: Date?
    let datePrecision: String?
    let upcoming: Bool?
    let cores: [Core]?
    let id: String?
}

// MARK: - Core
struct Core:Codable {
    let core: String?
    let flight: Int?
    let gridfins, legs, reused, landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType, landpad: String?
}

// MARK: - Links
struct Links:Codable {
    let patch: Patch?
    let reddit: Reddit?
    let flickr: Flickr?
    let presskit: String?
    let webcast: String?
    let youtubeID: String?
    let article, wikipedia: String?
}

// MARK: - Flickr
struct Flickr: Codable {
    let original: [String]?
}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String?
}

// MARK: - Reddit
struct Reddit: Codable {
    let campaign, launch, media, recovery: String?
}
