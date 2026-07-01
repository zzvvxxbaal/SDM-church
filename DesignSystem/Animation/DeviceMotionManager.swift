import CoreMotion
import Observation

@Observable
final class DeviceMotionManager {

    private let manager = CMMotionManager()

    var pitch: Double = 0
    var roll: Double = 0

    init() {
        guard manager.isDeviceMotionAvailable else { return }

        manager.deviceMotionUpdateInterval = 1 / 60

        manager.startDeviceMotionUpdates(to: .main) { [weak self] motion, _ in
            guard let motion else { return }

            self?.pitch = motion.attitude.pitch
            self?.roll = motion.attitude.roll
        }
    }

    deinit {
        manager.stopDeviceMotionUpdates()
    }
}