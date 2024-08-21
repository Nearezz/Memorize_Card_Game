import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","🕷️","😈","👺","🕸️","🧙","🙀","🐲","😱","💀","🍭"]
    
    @State var cardCount:Int = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount,id: \.self){ index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3,contentMode:.fit)
            }
        }.padding()
    }
    
    var cardCountAdjusters: some View{
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    func cardCountAdjuster(by offset:Int,symbol:String) -> some View {
        
        Button(action: {
            cardCount+=offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount+offset<1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by:-1,symbol:"rectangle.stack.badge.minus")
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus")
    }
}
struct CardView: View {
     let content : String
     @State var isFaceUp = false
     var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            
            base.fill(.orange).opacity(isFaceUp ? 0 : 1)
        }.onTapGesture{ // View Modifer
            isFaceUp.toggle()
            
            
        }
    }
}
















#Preview {
    ContentView()
}

















// The struct content view behaves like a View
 // Some view returns a the data in it

// if there is var in a struct you must provide the value
// You can do local variables in View Structs
// View Builder can only do conditionals, local variable assignments, lists
// Views are immutable
