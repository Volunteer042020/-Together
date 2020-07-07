
import Foundation

//У каждого класса реализующего данный протокол будет переменная id, которая возвращает название класса

protocol IdHaving: class {}


extension IdHaving {
    static var id: String {
        return String(describing: self)
    }
}
