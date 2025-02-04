import Foundation

public enum BlendMode: Int {
    case normal = 0
    case darken
    case multiply
}

public let BlendModeNormal: BlendMode = .normal
public let BlendModeDarken: BlendMode = .darken
public let BlendModeMultiply: BlendMode = .multiply 