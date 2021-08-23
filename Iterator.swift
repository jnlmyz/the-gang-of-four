//Iterator Pattern
//何かがたくさん集まっているときに、それを順番に指し示していき、全体をスキャンしていく処理






//for-in swfitの使い方
let names = ["Anna","Alex","Brain","Jack"]
for name in names { // nameでアクセス
    print("Hell, \(name)!")
}

let nomberOfLegs = ["spider":8, "ant":6, "cat":4] //辞書型。順序がない。コレクションタイプである
for (animalName, legCount) in nomberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 { // indexでループにアクセス
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power { //ループにアクセスできる変数はない
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")


let minutes = 10
for tickMark in 0..<minutes {
    //0から9までループされる
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by:minuteInterval){
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
    //2回ループされる
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
    //4回ループする
}
