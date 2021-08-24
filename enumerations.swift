//https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html

enum SomeEnumeration {
    // enumeration definition goes here
}

enum CompassPoint { //グループ化。これが新しい型になる？
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune //1行で表示もできる
}

var directionToHead = CompassPoint.west

directionToHead = .east //型を知っているので省略した書き方ができる

//Switchステートメントによる列挙型の値のマッチング
directionToHead = .south
switch directionToHead { //directionToHeadの値を考える
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth //全てのcaseを描かない場合は、defaultを使用する
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

//--------------列挙型の反復
enum Beverage: CaseIterable { //casterIterableプロトコルを使用することで。プロパティーが使えるようになる
    case coffee,tea,juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
//juice


//--------------関連価値　//たびたび変わる
//使用事例バーコード、チェックデジット

enum Barcode { //バーコードとチェク
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909,51226,3)

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}


//--------------生の値 //あらかじめ入力された値によって定義される

enum ASCIIControlCharcter: Character { //同じ型のデフォルト値を入れることができる
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}



//-------------暗黙的に割り当てられた生の値

enum PlanetA: Int {
    case mercury = 1, venus, earth, mars,jupiter,saturn,uranus, neptune //venusは2になる。earthは3になる
}

enum CompassPointA: String {
    case north, south, east, west
}



print(PlanetA.earth.rawValue)

//-------------生の値からの初期化 //失敗するイニシャライザ
let possiblePlanet = PlanetA(rawValue: 7) //失敗するイニシャライざ
//print(possiblePlanet) //列挙のケースまたはnilを返す

let positionToFind = 11
if let somePlanet = PlanetA(rawValue: positionToFind) { //オプショナルを外している
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

//-------------再帰的な列挙
enum ArithmeticExpression {
    case number(Int)
    indirect case addtion(ArithmeticExpression,ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression,ArithmeticExpression)
}

indirect enum ArithmeticExpressionA {
    case number(Int)//普通の数字
    case addition(ArithmeticExpressionA, ArithmeticExpressionA) //加算
    case multiplication(ArithmeticExpressionA, ArithmeticExpressionA) //乗算
}

let five = ArithmeticExpressionA.number(5)
let four = ArithmeticExpressionA.number(4)
let sum = ArithmeticExpressionA.addition(five, four)
let product = ArithmeticExpressionA.multiplication(sum, ArithmeticExpressionA.number(2))
print(product)


func evaluate(_ expression: ArithmeticExpressionA) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
