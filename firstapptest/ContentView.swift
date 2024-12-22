import SwiftUI

struct ContentView: View {
    @State private var firstNumber = ""
    @State private var secondNumber = ""
    @State private var result = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("İlk sayı", text: $firstNumber)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("İkinci sayı", text: $secondNumber)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Sonuç: \(result)")
                .font(.title)
                .padding()
            
            HStack(spacing: 15) {
                Button("Topla") {
                    calculate(operation: "+")
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                
                Button("Çıkar") {
                    calculate(operation: "-")
                }
                .buttonStyle(.bordered)
                .tint(.red)
                
                Button("Çarp") {
                    calculate(operation: "×")
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
                Button("Böl") {
                    calculate(operation: "÷")
                }
                .buttonStyle(.bordered)
                .tint(.orange)
            }
        }
        .padding()
    }
    
    func calculate(operation: String) {
        guard let first = Double(firstNumber),
              let second = Double(secondNumber) else {
            result = "Geçerli sayılar girin"
            return
        }
        
        switch operation {
        case "+":
            result = "\(first + second)"
        case "-":
            result = "\(first - second)"
        case "×":
            result = "\(first * second)"
        case "÷":
            if second == 0 {
                result = "Sıfıra bölünemez"
            } else {
                result = "\(first / second)"
            }
        default:
            result = "Hata"
        }
    }
}

#Preview {
    ContentView()
}
