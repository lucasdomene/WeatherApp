//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
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
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 28 colors.
  struct color {
    /// Color `ColorA1`.
    static let colorA1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorA1")
    /// Color `ColorA2`.
    static let colorA2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorA2")
    /// Color `ColorB1`.
    static let colorB1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorB1")
    /// Color `ColorB2`.
    static let colorB2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorB2")
    /// Color `ColorC1`.
    static let colorC1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorC1")
    /// Color `ColorC2`.
    static let colorC2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorC2")
    /// Color `ColorD1`.
    static let colorD1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorD1")
    /// Color `ColorD2`.
    static let colorD2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorD2")
    /// Color `ColorE1`.
    static let colorE1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorE1")
    /// Color `ColorE2`.
    static let colorE2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorE2")
    /// Color `ColorF1`.
    static let colorF1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorF1")
    /// Color `ColorF2`.
    static let colorF2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorF2")
    /// Color `ColorG1`.
    static let colorG1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorG1")
    /// Color `ColorG2`.
    static let colorG2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorG2")
    /// Color `ColorH1`.
    static let colorH1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorH1")
    /// Color `ColorH2`.
    static let colorH2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorH2")
    /// Color `ColorI1`.
    static let colorI1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorI1")
    /// Color `ColorI2`.
    static let colorI2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorI2")
    /// Color `ColorJ1`.
    static let colorJ1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorJ1")
    /// Color `ColorJ2`.
    static let colorJ2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorJ2")
    /// Color `ColorK1`.
    static let colorK1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorK1")
    /// Color `ColorK2`.
    static let colorK2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorK2")
    /// Color `ColorL1`.
    static let colorL1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorL1")
    /// Color `ColorL2`.
    static let colorL2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorL2")
    /// Color `ColorM1`.
    static let colorM1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorM1")
    /// Color `ColorM2`.
    static let colorM2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorM2")
    /// Color `ColorN1`.
    static let colorN1 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorN1")
    /// Color `ColorN2`.
    static let colorN2 = Rswift.ColorResource(bundle: R.hostingBundle, name: "ColorN2")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorA1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorA1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorA1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorA2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorA2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorA2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorB1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorB1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorB1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorB2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorB2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorB2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorC1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorC1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorC1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorC2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorC2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorC2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorD1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorD1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorD1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorD2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorD2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorD2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorE1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorE1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorE1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorE2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorE2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorE2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorF1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorF1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorF1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorF2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorF2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorF2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorG1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorG1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorG1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorG2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorG2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorG2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorH1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorH1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorH1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorH2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorH2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorH2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorI1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorI1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorI1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorI2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorI2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorI2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorJ1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorJ1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorJ1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorJ2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorJ2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorJ2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorK1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorK1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorK1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorK2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorK2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorK2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorL1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorL1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorL1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorL2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorL2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorL2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorM1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorM1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorM1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorM2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorM2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorM2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorN1", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorN1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorN1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "ColorN2", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func colorN2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.colorN2, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 12 files.
  struct file {
    /// Resource file `SF-Pro-Rounded-Black.otf`.
    static let sfProRoundedBlackOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Black", pathExtension: "otf")
    /// Resource file `SF-Pro-Rounded-Bold.otf`.
    static let sfProRoundedBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Bold", pathExtension: "otf")
    /// Resource file `SF-Pro-Rounded-Heavy.otf`.
    static let sfProRoundedHeavyOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Heavy", pathExtension: "otf")
    /// Resource file `SF-Pro-Rounded-Light.otf`.
    static let sfProRoundedLightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Light", pathExtension: "otf")
    /// Resource file `SF-Pro-Rounded-Medium.otf`.
    static let sfProRoundedMediumOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Medium", pathExtension: "otf")
    /// Resource file `SF-Pro-Rounded-Regular.otf`.
    static let sfProRoundedRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Regular", pathExtension: "otf")
    /// Resource file `SF-Pro-Rounded-Semibold.otf`.
    static let sfProRoundedSemiboldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Semibold", pathExtension: "otf")
    /// Resource file `SF-Pro-Rounded-Thin.otf`.
    static let sfProRoundedThinOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Thin", pathExtension: "otf")
    /// Resource file `SF-Pro-Rounded-Ultralight.otf`.
    static let sfProRoundedUltralightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Rounded-Ultralight", pathExtension: "otf")
    /// Resource file `cities.plist`.
    static let citiesPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "cities", pathExtension: "plist")
    /// Resource file `weather-condition.png`.
    static let weatherConditionPng = Rswift.FileResource(bundle: R.hostingBundle, name: "weather-condition", pathExtension: "png")
    /// Resource file `weatherResponse.json`.
    static let weatherResponseJson = Rswift.FileResource(bundle: R.hostingBundle, name: "weatherResponse", pathExtension: "json")

    /// `bundle.url(forResource: "SF-Pro-Rounded-Black", withExtension: "otf")`
    static func sfProRoundedBlackOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedBlackOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Rounded-Bold", withExtension: "otf")`
    static func sfProRoundedBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Rounded-Heavy", withExtension: "otf")`
    static func sfProRoundedHeavyOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedHeavyOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Rounded-Light", withExtension: "otf")`
    static func sfProRoundedLightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedLightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Rounded-Medium", withExtension: "otf")`
    static func sfProRoundedMediumOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedMediumOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Rounded-Regular", withExtension: "otf")`
    static func sfProRoundedRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Rounded-Semibold", withExtension: "otf")`
    static func sfProRoundedSemiboldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedSemiboldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Rounded-Thin", withExtension: "otf")`
    static func sfProRoundedThinOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedThinOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Rounded-Ultralight", withExtension: "otf")`
    static func sfProRoundedUltralightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProRoundedUltralightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "cities", withExtension: "plist")`
    static func citiesPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.citiesPlist
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "weather-condition", withExtension: "png")`
    static func weatherConditionPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.weatherConditionPng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "weatherResponse", withExtension: "json")`
    static func weatherResponseJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.weatherResponseJson
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 9 fonts.
  struct font: Rswift.Validatable {
    /// Font `SFProRounded-Black`.
    static let sfProRoundedBlack = Rswift.FontResource(fontName: "SFProRounded-Black")
    /// Font `SFProRounded-Bold`.
    static let sfProRoundedBold = Rswift.FontResource(fontName: "SFProRounded-Bold")
    /// Font `SFProRounded-Heavy`.
    static let sfProRoundedHeavy = Rswift.FontResource(fontName: "SFProRounded-Heavy")
    /// Font `SFProRounded-Light`.
    static let sfProRoundedLight = Rswift.FontResource(fontName: "SFProRounded-Light")
    /// Font `SFProRounded-Medium`.
    static let sfProRoundedMedium = Rswift.FontResource(fontName: "SFProRounded-Medium")
    /// Font `SFProRounded-Regular`.
    static let sfProRoundedRegular = Rswift.FontResource(fontName: "SFProRounded-Regular")
    /// Font `SFProRounded-Semibold`.
    static let sfProRoundedSemibold = Rswift.FontResource(fontName: "SFProRounded-Semibold")
    /// Font `SFProRounded-Thin`.
    static let sfProRoundedThin = Rswift.FontResource(fontName: "SFProRounded-Thin")
    /// Font `SFProRounded-Ultralight`.
    static let sfProRoundedUltralight = Rswift.FontResource(fontName: "SFProRounded-Ultralight")

    /// `UIFont(name: "SFProRounded-Black", size: ...)`
    static func sfProRoundedBlack(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedBlack, size: size)
    }

    /// `UIFont(name: "SFProRounded-Bold", size: ...)`
    static func sfProRoundedBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedBold, size: size)
    }

    /// `UIFont(name: "SFProRounded-Heavy", size: ...)`
    static func sfProRoundedHeavy(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedHeavy, size: size)
    }

    /// `UIFont(name: "SFProRounded-Light", size: ...)`
    static func sfProRoundedLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedLight, size: size)
    }

    /// `UIFont(name: "SFProRounded-Medium", size: ...)`
    static func sfProRoundedMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedMedium, size: size)
    }

    /// `UIFont(name: "SFProRounded-Regular", size: ...)`
    static func sfProRoundedRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedRegular, size: size)
    }

    /// `UIFont(name: "SFProRounded-Semibold", size: ...)`
    static func sfProRoundedSemibold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedSemibold, size: size)
    }

    /// `UIFont(name: "SFProRounded-Thin", size: ...)`
    static func sfProRoundedThin(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedThin, size: size)
    }

    /// `UIFont(name: "SFProRounded-Ultralight", size: ...)`
    static func sfProRoundedUltralight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProRoundedUltralight, size: size)
    }

    static func validate() throws {
      if R.font.sfProRoundedBlack(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Black' could not be loaded, is 'SF-Pro-Rounded-Black.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProRoundedBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Bold' could not be loaded, is 'SF-Pro-Rounded-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProRoundedHeavy(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Heavy' could not be loaded, is 'SF-Pro-Rounded-Heavy.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProRoundedLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Light' could not be loaded, is 'SF-Pro-Rounded-Light.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProRoundedMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Medium' could not be loaded, is 'SF-Pro-Rounded-Medium.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProRoundedRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Regular' could not be loaded, is 'SF-Pro-Rounded-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProRoundedSemibold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Semibold' could not be loaded, is 'SF-Pro-Rounded-Semibold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProRoundedThin(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Thin' could not be loaded, is 'SF-Pro-Rounded-Thin.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProRoundedUltralight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProRounded-Ultralight' could not be loaded, is 'SF-Pro-Rounded-Ultralight.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `backfround`.
    static let backfround = Rswift.ImageResource(bundle: R.hostingBundle, name: "backfround")
    /// Image `error`.
    static let error = Rswift.ImageResource(bundle: R.hostingBundle, name: "error")
    /// Image `shake`.
    static let shake = Rswift.ImageResource(bundle: R.hostingBundle, name: "shake")
    /// Image `weather-condition`.
    static let weatherCondition = Rswift.ImageResource(bundle: R.hostingBundle, name: "weather-condition")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "backfround", bundle: ..., traitCollection: ...)`
    static func backfround(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.backfround, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "error", bundle: ..., traitCollection: ...)`
    static func error(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.error, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "shake", bundle: ..., traitCollection: ...)`
    static func shake(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.shake, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "weather-condition", bundle: ..., traitCollection: ...)`
    static func weatherCondition(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.weatherCondition, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

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
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if UIKit.UIImage(named: "backfround", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'backfround' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
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
