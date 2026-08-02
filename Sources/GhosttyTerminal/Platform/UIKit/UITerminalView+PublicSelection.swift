//
//  UITerminalView+PublicSelection.swift
//  libghostty-spm
//
//  Public face of the core's selection state for hosts driving in-place
//  touch selection (TerminalSurfaceTouchSelectionDelegate): after the
//  gesture ends the host reads the selected text for its edit menu's Copy.
//  The selection itself lives — and renders — in ghostty; the host never
//  sees grid coordinates, only the resolved text.
//

#if canImport(UIKit) && !targetEnvironment(macCatalyst)
    import Foundation
    import UIKit

    @MainActor
    extension UITerminalView {
        /// Whether the core currently holds a selection.
        public var terminalHasSelection: Bool {
            surface?.hasSelection() ?? false
        }

        /// The core's current selection as text (lines joined with `\n`),
        /// or `nil` when there is no selection or no surface. The grid pads
        /// rows with trailing spaces; hosts putting this on a clipboard
        /// should strip per-line trailing whitespace.
        public func terminalSelectedText() -> String? {
            surface?.readSelection()
        }
    }
#endif
