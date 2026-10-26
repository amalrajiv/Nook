// Licensed under GPL-3.0. See LICENSE.
//
//  VeilDesign.swift
//  VEIL
//
//  VEIL's geometry where it differs from Nook's, for app-target code. Values come from the Dia
//  measurements in the VEIL plan (research/dia-visual-audit.md). Non-VEIL builds keep Nook's.
//

import CoreGraphics

enum VeilDesign {
    #if VEIL_BUILD
    /// The tinted frame between the window edge and the content card (top, side, bottom).
    static let contentFrame: CGFloat = 6
    /// Widest the sidebar can be dragged.
    static let sidebarMax: CGFloat = 440
    /// Dragging the sidebar narrower than this hides it.
    static let sidebarCollapseWidth: CGFloat = 100
    /// Vertical padding of the top bar's address pill: 1pt around its 28pt controls gives Dia's 30pt pill.
    static let addressPillVerticalPadding: CGFloat = 1
    #else
    static let contentFrame: CGFloat = 8
    static let sidebarMax: CGFloat = 520
    static let sidebarCollapseWidth: CGFloat = 0
    static let addressPillVerticalPadding: CGFloat = 6
    #endif
}
