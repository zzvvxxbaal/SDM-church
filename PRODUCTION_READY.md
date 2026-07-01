# PRODUCTION READY

## Architecture overview
- **App entry**: `App/SDMYouthApp.swift`
- **Global app state**: `Shared/Services/AppState.swift`
- **Navigation**: `Shared/Services/AppRouter.swift`, `Core/Navigation/NavigationCoordinator.swift`, `App/Rootview.swift`
- **Feature modules**: `Features/Authentication`, `Features/Home`, `Features/Worship`, `Features/Prayer`, `Features/Community`, `Features/Notice`, `Features/Calendar`, `Features/Profile`, `Features/Settings`
- **Design system**: `DesignSystem/Foundation`, `DesignSystem/Components`, `DesignSystem/Glass`, `DesignSystem/Animation`

## Key design decisions
- Use a single injected `AppState` to own login state, theme state, notification preferences, and shared coordinators.
- Route all tab and push navigation through `RootView` and the shared `NavigationCoordinator`.
- Prefer design-system tokens (`AppSpacing`, `AppFonts`, `AppColors`, `AppRadius`) over hardcoded styling values.
- Use `LazyVStack` in scroll-heavy screens to reduce eager layout work.
- Keep motion/display resources scoped and cleaned up with `deinit`/`onDisappear`.

## Performance optimizations applied
- Converted major scroll screens to `LazyVStack`.
- Added stable `.id(...)` values to dynamic rows/cards for better diffing.
- Removed redundant state such as derived large-title state and unnecessary feature `@State` view models.
- Centralized app theme toggling in `AppState` and removed duplicate coordinator setup in `AppRouter`.
- Added device-motion cleanup and navigation observer cleanup.
- Reduced unnecessary accessibility work by hiding decorative overlay icons.

## Build instructions
1. Use **Xcode 16+** with an **iOS 17+** deployment target.
2. Add the repository sources to an iOS app target or open the existing project containing these sources.
3. Ensure the app entry point is `App/SDMYouthApp.swift`.
4. Build and run on iPhone simulator and device.

## Testing checklist
- [ ] Launch app and verify all five tabs render correctly.
- [ ] Toggle dark mode in Settings and confirm full-app color scheme changes.
- [ ] Validate Dynamic Type at Small, Default, Large, XL, XXL, and XXXL.
- [ ] Verify VoiceOver labels for tabs, toggles, cards, and buttons.
- [ ] Navigate to each `AppRoute` destination and confirm no broken links.
- [ ] Confirm home and feature scroll performance stays smooth during glass/motion rendering.
- [ ] Verify motion-heavy views stop updating after dismissal.
- [ ] Run device validation for portrait, landscape, and reduced-motion/reduced-transparency settings.

## Deployment steps
1. Build a Release configuration.
2. Run accessibility, dark mode, and Dynamic Type checks on device.
3. Validate navigation and feature flows against the checklist above.
4. Archive in Xcode.
5. Upload to App Store Connect.
6. Complete TestFlight smoke testing before App Store submission.

## Dependencies and versions
- **Swift toolchain used for validation context**: `Swift 6.3.2`
- **Apple frameworks**: SwiftUI, Observation, UIKit, CoreMotion, Foundation
- **External package dependencies**: none declared in this repository

## Known limitations
- This repository snapshot does not include an `.xcodeproj` or `Package.swift`, so full Apple-SDK compilation could not be executed in the current Linux validation environment.
- Final device profiling for 60 FPS, contrast verification, and keyboard/VoiceOver traversal should be completed in Xcode on macOS before release.
