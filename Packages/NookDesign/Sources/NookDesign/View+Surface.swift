// Licensed under GPL-3.0. See LICENSE.
//
//  View+Surface.swift
//  Nook
//
//  The surface recipes every layer goes through. Nook draws no Liquid Glass: floating layers
//  are solid cards, sidebar chrome and rows are Surface fills.
//

import SwiftUI

public extension View {
    /// A layer that floats over content: solid raised card, hairline edge, floating shadow.
    func nookFloatingSurface<S: InsettableShape>(in shape: S) -> some View {
        self.clipShape(shape)
            .background(shape.fill(NookDesign.Surface.raised))
            .overlay(shape.strokeBorder(NookDesign.Surface.hairline, lineWidth: NookDesign.Size.hairlineWidth))
            .nookElevation(.floating)
    }

    /// Controls over video: a dark scrim, whatever the page or appearance.
    func nookMediaControl<S: Shape>(in shape: S) -> some View {
        background(shape.fill(NookDesign.Surface.mediaScrim))
    }

    /// The selected sidebar row or pinned tile. Branch-free so view identity is stable and the
    /// change animates; the row applies its own `.raised` elevation.
    func nookRowSelection(_ isSelected: Bool, radius: CGFloat = NookDesign.Radius.md) -> some View {
        let shape = NookDesign.Radius.shape(radius)
        // VEIL: Nook draws a 1pt 8% hairline; Dia's selected pill has a brighter 0.5pt edge and a soft shadow.
        return background(shape.fill(isSelected ? NookDesign.Surface.raised : .clear)
                .shadow(color: .black.opacity(isSelected ? 0.22 : 0), radius: 6, y: 1))
            .overlay(shape.strokeBorder(Color.primary.opacity(isSelected ? 0.16 : 0), lineWidth: 0.5))
    }

    /// A sidebar chrome control or group: history, sidebar and AI toggles, bottom bar buttons,
    /// search fields, filter chips. `tint` marks the chosen one of a set.
    func nookControlSurface<S: InsettableShape>(_ isOn: Bool = true, tint: Color? = nil, in shape: S) -> some View {
        background(shape.fill(isOn ? (tint?.opacity(NookDesign.Surface.tintOpacity) ?? NookDesign.Surface.fill) : .clear))
    }
}
