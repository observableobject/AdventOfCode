
import Foundation

enum Day: Int {
    case dayOne
    case dayTwo
    case dayThree
    case dayFour
    case dayFive
    case daySix
    case daySeven
    case dayEight
    case dayNine
    case dayTen
    
    var stringValue: String {
        switch self {
        case .dayOne: return "dayOne"
        case .dayTwo: return "dayTwo"
        case .dayThree: return "dayThree"
        case .dayFour: return "dayFour"
        case .dayFive: return "dayFive"
        case .daySix: return "daySix"
        case .daySeven: return "daySeven"
        case .dayEight: return "dayEight"
        case .dayNine: return "dayNine"
        case .dayTen: return "dayTen"
        }
    }
}
