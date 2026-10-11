import Foundation

/// Display-only translation for strings created dynamically instead of passed
/// as SwiftUI LocalizedStringKey. Falls back to the original text safely.
extension String {
    var localizedUI: String {
        #if STREMIOX_RUSSIAN_UI
        guard let path = Bundle.main.path(forResource: "ru", ofType: "lproj"),
              let bundle = Bundle(path: path) else { return self }
        return bundle.localizedString(forKey: self, value: self, table: "Localizable")
        #else
        return self
        #endif
    }
}
