//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `CancelledTicketInfoInputViewController`.
    static let cancelledTicketInfoInputViewController = _R.storyboard.cancelledTicketInfoInputViewController()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "CancelledTicketInfoInputViewController", bundle: ...)`
    static func cancelledTicketInfoInputViewController(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.cancelledTicketInfoInputViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.nib` struct is generated, and contains static references to 5 nibs.
  struct nib {
    /// Nib `PlanCandidatesTableViewCell`.
    static let planCandidatesTableViewCell = _R.nib._PlanCandidatesTableViewCell()
    /// Nib `PlanCandidatesTableViewController`.
    static let planCandidatesTableViewController = _R.nib._PlanCandidatesTableViewController()
    /// Nib `RetuernTripCandidatesTableViewCell`.
    static let retuernTripCandidatesTableViewCell = _R.nib._RetuernTripCandidatesTableViewCell()
    /// Nib `RetuernTripCandidatesView`.
    static let retuernTripCandidatesView = _R.nib._RetuernTripCandidatesView()
    /// Nib `RouteViewController`.
    static let routeViewController = _R.nib._RouteViewController()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "PlanCandidatesTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.planCandidatesTableViewCell) instead")
    static func planCandidatesTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.planCandidatesTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "PlanCandidatesTableViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.planCandidatesTableViewController) instead")
    static func planCandidatesTableViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.planCandidatesTableViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "RetuernTripCandidatesTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.retuernTripCandidatesTableViewCell) instead")
    static func retuernTripCandidatesTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.retuernTripCandidatesTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "RetuernTripCandidatesView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.retuernTripCandidatesView) instead")
    static func retuernTripCandidatesView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.retuernTripCandidatesView)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "RouteViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.routeViewController) instead")
    static func routeViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.routeViewController)
    }
    #endif

    static func planCandidatesTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PlanCandidatesTableViewCell? {
      return R.nib.planCandidatesTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PlanCandidatesTableViewCell
    }

    static func planCandidatesTableViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.planCandidatesTableViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func retuernTripCandidatesTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> RetuernTripCandidatesTableViewCell? {
      return R.nib.retuernTripCandidatesTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? RetuernTripCandidatesTableViewCell
    }

    static func retuernTripCandidatesView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> RetuernTripCandidatesView? {
      return R.nib.retuernTripCandidatesView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? RetuernTripCandidatesView
    }

    static func routeViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.routeViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `PlanCandidatesTableViewCell`.
    static let planCandidatesTableViewCell: Rswift.ReuseIdentifier<PlanCandidatesTableViewCell> = Rswift.ReuseIdentifier(identifier: "PlanCandidatesTableViewCell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _PlanCandidatesTableViewCell.validate()
    }

    struct _PlanCandidatesTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = PlanCandidatesTableViewCell

      let bundle = R.hostingBundle
      let identifier = "PlanCandidatesTableViewCell"
      let name = "PlanCandidatesTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> PlanCandidatesTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? PlanCandidatesTableViewCell
      }

      static func validate() throws {
        if UIKit.UIImage(named: "7921463931110066", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '7921463931110066' is used in nib 'PlanCandidatesTableViewCell', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    struct _PlanCandidatesTableViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "PlanCandidatesTableViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _RetuernTripCandidatesTableViewCell: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "RetuernTripCandidatesTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> RetuernTripCandidatesTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? RetuernTripCandidatesTableViewCell
      }

      fileprivate init() {}
    }

    struct _RetuernTripCandidatesView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "RetuernTripCandidatesView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> RetuernTripCandidatesView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? RetuernTripCandidatesView
      }

      fileprivate init() {}
    }

    struct _RouteViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "RouteViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try cancelledTicketInfoInputViewController.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct cancelledTicketInfoInputViewController: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "CancelledTicketInfoInputViewController"

      static func validate() throws {
        if UIKit.UIImage(named: "7921463931110066", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '7921463931110066' is used in storyboard 'CancelledTicketInfoInputViewController', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
