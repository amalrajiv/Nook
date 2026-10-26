// Licensed under GPL-3.0. See LICENSE.
//
//  VeilPolicy.swift
//  VEIL
//
//  Upstream features VEIL switches off. Kept in a VEIL-only file so the upstream files
//  only carry one-line `#if VEIL_BUILD` hooks into it.
//

import Foundation
import NookSettings

#if VEIL_BUILD
enum VeilPolicy {
    /// Shortcuts for features VEIL does not ship. Hidden from Settings > Shortcuts and never run.
    static let hiddenShortcutActions: Set<ShortcutAction> = [.toggleAIAssistant, .organizeTabs]

    /// Settings tabs VEIL does not show.
    static let hiddenSettingsTabs: Set<SettingsTabs> = [.ai]

    /// Forces AI features off at every launch, whatever an earlier build saved.
    @MainActor
    static func apply(to settings: NookSettingsService) {
        settings.showAIAssistant = false
        settings.tabOrganizerEnabled = false

        // Dia's layout: the address bar sits on top of the page. Set once so Settings can undo it.
        let didSetTopBarKey = "veil.didSetTopBar"
        if !UserDefaults.standard.bool(forKey: didSetTopBarKey) {
            settings.topBarAddressView = true
            UserDefaults.standard.set(true, forKey: didSetTopBarKey)
        }

        // DuckDuckGo is VEIL's default search, set once so a later choice in Settings sticks.
        let didSetSearchKey = "veil.didSetDefaultSearch"
        if !UserDefaults.standard.bool(forKey: didSetSearchKey) {
            settings.searchEngineId = SearchProvider.duckDuckGo.rawValue
            UserDefaults.standard.set(true, forKey: didSetSearchKey)
        }
    }
}
#endif
