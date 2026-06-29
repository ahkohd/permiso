import AppKit
import Foundation

public enum PermisoPanel: String, CaseIterable, Sendable {
    case accessibility = "Privacy_Accessibility"
    case screenRecording = "Privacy_ScreenCapture"
    case fullDiskAccess = "Privacy_AllFiles"

    public var title: String {
        switch self {
        case .accessibility:
            "Accessibility"
        case .screenRecording:
            "Screen Recording"
        case .fullDiskAccess:
            "Full Disk Access"
        }
    }

    public var settingsURL: URL {
        settingsURLs[0]
    }

    public var settingsURLs: [URL] {
        let candidates: [String]
        switch self {
        case .fullDiskAccess:
            candidates = [
                "x-apple.systempreferences:com.apple.preference.security?\(rawValue)",
                "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?\(rawValue)",
                "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension",
            ]
        default:
            candidates = [
                "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?\(rawValue)",
                "x-apple.systempreferences:com.apple.preference.security?\(rawValue)",
            ]
        }
        return candidates.compactMap(URL.init(string:))
    }
}
