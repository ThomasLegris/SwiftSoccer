//
//  RealmModels.swift
//  SwiftSoccer
//
//  Created by Thomas LEGRIS in 2022.
//

import RealmSwift
import Foundation

/// Realm object to store teams.
final class TeamsObject: Object {
    // MARK: - Internal Properties
    var teams: List<TeamObject> = List<TeamObject>()
    @objc dynamic var countryId: String = ""
}

/// The team object in team objects list.
final class TeamObject: Object {
    // MARK: - Internal Properties
    @objc dynamic var identifier: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var shortName: String = ""
    @objc dynamic var iconName: String = ""
}
