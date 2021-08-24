//https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
//protocol
//「プロトコルの要件」という概念がある

struct SomeStructure: FirstProtocol,AnotherProtocol { //複数のプロトコルを実装できる
    // ストラクチャーの定義はここでする
}

class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol { //スーパークラス名の後につける
    //クラスの定義はここでする
}

enum hello {
    
}


//-------------------プロパティーの要件-------------------
protocol SomeProtocol { //適合する型に対して、特定の名前と
    var mustBeSettable: Int { get set } //取得設定可能なプロパティーはgetset
    var doesNotNeedToBeSettable: Int { get } //取得可能な
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String //プロトコルFullyNamedを使用したので、プロパティーも揃えないといけない
}

let john = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "")  + name //三項演算子
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")

//-------------------メソッドの要件-------------------

protocol SomeMethodProtocol {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenrator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

//-------------------メソッドの要件-------------------
protocol Togglable {
    mutating func toggle() //mutatingをつけることで、メソッドが呼び出された時に適合するインスタンスの状態を変化させることが期待されていることを示している
}

enum OnOffSwitch : Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off //インスタンス・メソッド内からの値型の変更
lightSwitch.toggle()
