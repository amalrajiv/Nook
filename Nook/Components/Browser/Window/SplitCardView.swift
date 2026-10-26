// Licensed under GPL-3.0. See LICENSE.
//
//  SplitCardView.swift
//  Nook
//
//  Created by Maciek Bagiński on 09/12/2025.
//

import SwiftUI
import NookDesign

struct SplitCardView: View {
    var icon: String
    var text: String
    var isTabHovered: Bool
    var accentColor: Color = .blue
    
    private var currentTextColor: Color {
        #if VEIL_BUILD
        // Nook used the raw accent over a fixed white: a grey accent vanished on the dark card,
        // and white vanished on the light one. The theme's title tint reads in both.
        isTabHovered ? NookDesign.Surface.titleTint(accent: accentColor) : .primary
        #else
        isTabHovered ? accentColor : .white
        #endif
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 12) {
                Image(systemName: icon)
                    .font(NookDesign.Font.heading)
                    .foregroundStyle(currentTextColor)
                Text(text)
                    .font(NookDesign.Font.secondary)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(currentTextColor)
                    .frame(maxWidth: .infinity)
            }
            .opacity(0.6)
            
            NookDesign.Radius.shape(NookDesign.Radius.lg)
                .strokeBorder(currentTextColor, style: StrokeStyle(lineWidth: 2, dash: [7,10]))
                .opacity(0.3)
        }
        #if VEIL_BUILD
        // Dia's cards: 313 x 521 at rest, 361 x 599 under the pointer (with the 8pt padding).
        .frame(width: isTabHovered ? 345 : 297, height: isTabHovered ? 583 : 505)
        #else
        .frame(width: 237, height: 394)
        #endif
        .padding(8)
        .background(
            Color(currentTextColor)
                .opacity(0.1)
        )
        .nookFloatingSurface(in: NookDesign.Radius.shape(NookDesign.Radius.lg))
        .animation(NookDesign.Motion.standard, value: currentTextColor)
        .animation(NookDesign.Motion.spring, value: isTabHovered)
    }
}
