import SwiftUI

/// # Phase 5: Motion System - Complete Usage Examples
///
/// This file contains comprehensive, production-ready examples of using
/// the Apple Motion System in real-world scenarios.

// MARK: - Button Interactions

/// Example 1: Standard Button with Motion
struct MotionButtonExample: View {
    @State private var isPressed = false
    
    var body: some View {
        Button("Press Me") {
            print("Button tapped")
        }
        .buttonStyle(.plain)
        .font(.headline)
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(Color.blue.opacity(0.2))
        .cornerRadius(12)
        .buttonPress(isPressed: isPressed, scale: 0.95, opacity: 0.8, hapticFeedback: true)
        .onTouchDown { isPressed = true }
        .onTouchUp { isPressed = false }
    }
}

/// Example 2: Icon Button with Motion
struct MotionIconButtonExample: View {
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: "star.fill")
                .font(.title2)
        }
        .buttonStyle(.plain)
        .frame(width: 52, height: 52)
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(26)
        .buttonPress(isPressed: isPressed, scale: 0.9, opacity: 0.7, hapticFeedback: true)
        .onTouchDown { isPressed = true }
        .onTouchUp { isPressed = false }
    }
}

/// Example 3: Floating Action Button
struct MotionFABExample: View {
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: "plus")
                .font(.title2)
                .frame(width: 64, height: 64)
        }
        .buttonStyle(.plain)
        .background(Color.green.opacity(0.2))
        .cornerRadius(32)
        .buttonPress(isPressed: isPressed, scale: 0.92, hapticFeedback: true)
        .floating(offset: 6, duration: 2.5)
        .onTouchDown { isPressed = true }
        .onTouchUp { isPressed = false }
    }
}

// MARK: - Card Interactions

/// Example 4: Hoverable Card with Lift Animation
struct MotionCardLiftExample: View {
    @State private var isHovering = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Card Title")
                .font(.headline)
            
            Text("This card lifts up when you hover over it.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.blue.opacity(0.05))
        .cornerRadius(12)
        .cardLift(isHovering: isHovering, elevation: 12)
        .onHover { isHovering = $0 }
    }
}

/// Example 5: Expandable Card with Expand Animation
struct MotionCardExpandExample: View {
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Expandable Card")
                        .font(.headline)
                    
                    Text("Tap to expand")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .rotationEffect(.degrees(isExpanded ? 90 : 0))
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isExpanded)
            }
            
            if isExpanded {
                Divider()
                    .padding(.vertical, 8)
                
                Text("Expanded content appears here with smooth animation.")
                    .font(.body)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.purple.opacity(0.05))
        .cornerRadius(12)
        .cardExpand(isExpanded: isExpanded, scale: 1.02)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isExpanded.toggle()
            }
        }
    }
}

// MARK: - Scroll Animations

/// Example 6: Parallax Background on Scroll
struct MotionParallaxExample: View {
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Hero image with parallax
                Image(systemName: "photo.fill")
                    .font(.system(size: 120))
                    .foregroundStyle(.blue.opacity(0.3))
                    .frame(height: 300)
                    .parallax(scrollOffset: scrollOffset, multiplier: 0.5)
                
                // Content
                VStack(spacing: 16) {
                    ForEach(0..<10, id: \.self) { index in
                        HStack {
                            Circle()
                                .fill(Color.blue.opacity(0.3))
                                .frame(width: 12, height: 12)
                            
                            Text("Item \(index + 1)")
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
        }
        .onScrollGeometryChange(
            for: CGFloat.self,
            of: { geometry in geometry.contentOffset.y },
            initial: 0
        ) { _, newValue in
            scrollOffset = newValue
        }
    }
}

/// Example 7: Large Title Collapse on Scroll
struct MotionTitleCollapseExample: View {
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Scroll Title")
                    .font(.system(size: 34, weight: .bold))
                    .largeTitleCollapse(scrollOffset: scrollOffset, threshold: 50)
                
                ForEach(0..<20, id: \.self) { index in
                    Text("Item \(index + 1)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(12)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .onScrollGeometryChange(
            for: CGFloat.self,
            of: { geometry in geometry.contentOffset.y },
            initial: 0
        ) { _, newValue in
            scrollOffset = newValue
        }
    }
}

// MARK: - State Animations

/// Example 8: Loading State with Spinner
struct MotionLoadingExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "arrowtriangle.right.fill")
                .font(.system(size: 40))
                .loadingState(duration: 2.0)
            
            Text("Loading...")
        }
    }
}

/// Example 9: Empty State Animation
struct MotionEmptyExample: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "tray.fill")
                .font(.system(size: 64))
                .foregroundStyle(.gray.opacity(0.5))
                .emptyState(scale: 0.95, duration: 1.5)
            
            Text("No Items")
                .font(.headline)
            
            Text("There are no items to display")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

/// Example 10: Success State Animation
struct MotionSuccessExample: View {
    @State private var isSuccessful = false
    
    var body: some View {
        VStack(spacing: 20) {
            if isSuccessful {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.green)
                    .successState(isSuccessful: isSuccessful, scale: 1.2)
            } else {
                Image(systemName: "hourglass")
                    .font(.system(size: 60))
                    .loadingState(duration: 2.0)
            }
            
            Button(isSuccessful ? "Complete" : "Processing") {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                    isSuccessful.toggle()
                }
            }
            .buttonPress(isPressed: false)
        }
    }
}

/// Example 11: Error State with Shake
struct MotionErrorExample: View {
    @State private var isError = false
    
    var body: some View {
        VStack(spacing: 20) {
            if isError {
                VStack(spacing: 12) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.red)
                    
                    Text("Something went wrong")
                        .font(.headline)
                }
                .errorState(isError: isError, shakeIntensity: 10)
            } else {
                Text("No errors")
                    .font(.headline)
            }
            
            Button(isError ? "Dismiss Error" : "Show Error") {
                isError.toggle()
            }
            .buttonPress(isPressed: false)
        }
    }
}

// MARK: - Icon Animations

/// Example 12: Icon with Bounce Animation
struct MotionIconBounceExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.fill")
                .font(.system(size: 48))
                .foregroundStyle(.yellow)
                .iconBounce(height: 8, duration: 0.6)
            
            Text("Bouncing Star")
        }
    }
}

/// Example 13: Icon with Pulse Animation
struct MotionIconPulseExample: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "heart.fill")
                .font(.system(size: 48))
                .foregroundStyle(.red)
                .iconPulse(scale: 1.2, duration: 1.5)
            
            Text("Pulsing Heart")
        }
    }
}

/// Example 14: Icon Appear/Disappear
struct MotionIconAppearExample: View {
    @State private var isVisible = true
    
    var body: some View {
        VStack(spacing: 20) {
            if isVisible {
                Image(systemName: "star.fill")
                    .font(.system(size: 48))
                    .foregroundStyle(.purple)
                    .iconAppear(isVisible: isVisible)
            }
            
            Button(isVisible ? "Hide" : "Show") {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                    isVisible.toggle()
                }
            }
            .buttonPress(isPressed: false)
        }
    }
}

// MARK: - Combined Animations

/// Example 15: Complete Card Component with Multiple Animations
struct MotionCompleteCardExample: View {
    @State private var isPressed = false
    @State private var isHovering = false
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Premium Feature")
                        .font(.headline)
                    
                    Text("Tap for more details")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundStyle(.secondary)
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isExpanded)
            }
            
            if isExpanded {
                Divider()
                
                Text("This card demonstrates multiple animation layers: press feedback, hover lift, and expand animation.")
                    .font(.body)
                    .lineLimit(nil)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.blue.opacity(0.05)
                .cornerRadius(12)
        )
        .buttonPress(isPressed: isPressed, scale: 0.98, opacity: 0.9)
        .cardLift(isHovering: isHovering, elevation: 8)
        .cardExpand(isExpanded: isExpanded, scale: 1.02)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isExpanded.toggle()
            }
        }
        .onHover { isHovering = $0 }
        .onTouchDown { isPressed = true }
        .onTouchUp { isPressed = false }
    }
}

// MARK: - Previews

#Preview("Button Motion") {
    MotionButtonExample()
        .padding()
}

#Preview("Card Lift Motion") {
    MotionCardLiftExample()
        .padding()
}

#Preview("Loading State") {
    MotionLoadingExample()
}

#Preview("Complete Card") {
    MotionCompleteCardExample()
        .padding()
}
