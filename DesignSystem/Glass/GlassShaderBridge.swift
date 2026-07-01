import SwiftUI
import MetalKit

protocol GlassShaderProtocol {
    func render(in texture: MTLTexture, commandBuffer: MTLCommandBuffer)
    var isSupported: Bool { get }
    var name: String { get }
}

protocol GlassMetalRendererProtocol {
    func initialize() throws
    func render(
        content: UIImage,
        with configuration: GlassConfiguration,
        in view: MTKView
    ) -> UIImage?
    func shutdown()
    var isAvailable: Bool { get }
}

class GlassShaderAbstraction {
    private var metalRenderer: GlassMetalRendererProtocol?
    private let swiftUIFallback: GlassSwiftUIFallback
    
    init() {
        self.swiftUIFallback = GlassSwiftUIFallback()
        self.initializeMetalIfAvailable()
    }
    
    private func initializeMetalIfAvailable() {
        guard let device = MTLCreateSystemDefaultDevice() else { return }
        
        if #available(iOS 14.0, *) {
            if let renderer = try? GlassMetalRenderer(device: device) {
                self.metalRenderer = renderer
            }
        }
    }
    
    func render(
        with configuration: GlassConfiguration,
        materialType: GlassMaterialType
    ) -> AnyView {
        if let metalRenderer = metalRenderer, metalRenderer.isAvailable {
            return AnyView(
                GlassMetalView(
                    renderer: metalRenderer,
                    configuration: configuration,
                    materialType: materialType
                )
            )
        }
        
        return AnyView(
            swiftUIFallback.render(
                with: configuration,
                materialType: materialType
            )
        )
    }
}

class GlassSwiftUIFallback {
    func render(
        with configuration: GlassConfiguration,
        materialType: GlassMaterialType
    ) -> some View {
        ZStack {
            Color.white.opacity(materialType.opacity * configuration.opacityMultiplier)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(materialType.edgeHighlightOpacity * configuration.highlightIntensity),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}

@available(iOS 14.0, *)
class GlassMetalRenderer: NSObject, GlassMetalRendererProtocol {
    let device: MTLDevice
    let commandQueue: MTLCommandQueue?
    var isAvailable: Bool { device.supportsFeatureSet(.iOS_GPUFamily4_v1) }
    
    init(device: MTLDevice) throws {
        self.device = device
        self.commandQueue = device.makeCommandQueue()
        super.init()
    }
    
    func initialize() throws {
    }
    
    func render(
        content: UIImage,
        with configuration: GlassConfiguration,
        in view: MTKView
    ) -> UIImage? {
        nil
    }
    
    func shutdown() {
    }
}

struct GlassMetalView: View {
    let renderer: GlassMetalRendererProtocol
    let configuration: GlassConfiguration
    let materialType: GlassMaterialType
    
    var body: some View {
        ZStack {
            Color.white.opacity(materialType.opacity * configuration.opacityMultiplier)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(materialType.edgeHighlightOpacity * configuration.highlightIntensity),
                    Color.clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}

struct GlassShaderBridge {
    static func supportsMetalRendering() -> Bool {
        if #available(iOS 14.0, *) {
            guard let device = MTLCreateSystemDefaultDevice() else { return false }
            return device.supportsFeatureSet(.iOS_GPUFamily4_v1)
        }
        return false
    }
    
    static func getOptimalRenderer() -> GlassRendererType {
        supportsMetalRendering() ? .metal : .swiftUI
    }
}

enum GlassRendererType {
    case swiftUI
    case metal
}

extension View {
    func glassShaderOptimized(
        _ materialType: GlassMaterialType = .regular,
        cornerRadius: CGFloat = 16,
        configuration: GlassConfiguration = .default
    ) -> some View {
        let rendererType = GlassShaderBridge.getOptimalRenderer()
        
        return ZStack {
            self
                .background(
                    ZStack {
                        Color.white.opacity(materialType.opacity * configuration.opacityMultiplier)
                        
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white.opacity(materialType.edgeHighlightOpacity * configuration.highlightIntensity),
                                Color.clear
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    }
                )
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
    }
}
