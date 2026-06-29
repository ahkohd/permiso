import Testing
@testable import Permiso

@Suite("PermisoPanel")
struct PermisoTests {
    @Test("Accessibility deep link")
    func accessibilityURL() {
        #expect(PermisoPanel.accessibility.settingsURL.absoluteString == "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?Privacy_Accessibility")
    }

    @Test("Screen Recording deep link")
    func screenRecordingURL() {
        #expect(PermisoPanel.screenRecording.settingsURL.absoluteString == "x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?Privacy_ScreenCapture")
    }

    @Test("Full Disk Access deep links")
    func fullDiskAccessURLs() {
        #expect(PermisoPanel.fullDiskAccess.title == "Full Disk Access")
        #expect(PermisoPanel.fullDiskAccess.settingsURL.absoluteString == "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles")
        #expect(PermisoPanel.fullDiskAccess.settingsURLs.map(\.absoluteString).contains("x-apple.systempreferences:com.apple.settings.PrivacySecurity.extension?Privacy_AllFiles"))
    }
}
