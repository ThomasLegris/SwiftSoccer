// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Swift Soccer
  internal static let appTitle = L10n.tr("Localizable", "app_title")
  /// Chargement en cours
  internal static let commonLoading = L10n.tr("Localizable", "common_loading")
  /// Erreur
  internal static let commonError = L10n.tr("Localizable", "commonError")
  /// Ok
  internal static let commonOk = L10n.tr("Localizable", "commonOk")
  /// -
  internal static let dash = L10n.tr("Localizable", "dash")
  /// Pas d'internet
  internal static let errorNoInternet = L10n.tr("Localizable", "errorNoInternet")
  /// Verifiez votre connexion internet pour accéder à l'application SwiftSoccer
  internal static let errorNoInternetDescription = L10n.tr("Localizable", "errorNoInternetDescription")
  /// Résultats
  internal static let homeLiveResults = L10n.tr("Localizable", "home_live_results")
  /// Classement
  internal static let homeRanking = L10n.tr("Localizable", "home_ranking")
  /// Buteurs
  internal static let homeScorers = L10n.tr("Localizable", "home_scorers")
  /// B
  internal static let scorersGoalsScored = L10n.tr("Localizable", "scorers_goals_scored")
  /// MJ
  internal static let scorersMatchesPlayed = L10n.tr("Localizable", "scorers_matches_played")
  /// Nom
  internal static let scorersName = L10n.tr("Localizable", "scorers_name")
  /// Ligue 1
  internal static let seasonLigue1 = L10n.tr("Localizable", "season_ligue_1")
  /// Ligue 2
  internal static let seasonLigue2 = L10n.tr("Localizable", "season_ligue_2")
  /// Ligue 2
  internal static let standingClubs = L10n.tr("Localizable", "standing_clubs")
  /// db
  internal static let standingGoalDiff = L10n.tr("Localizable", "standing_goal_diff")
  /// Pts
  internal static let standingPoints = L10n.tr("Localizable", "standing_points")
  /// Rank
  internal static let standingRank = L10n.tr("Localizable", "standing_rank")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
