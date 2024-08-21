import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","🕷️","😈","🥵"]
    
    var body: some View {
        HStack{
            
            ForEach(emojis.indices,id: \.self){ index in
                CardView(content:emojis[index])
            }
        }.padding()
    }
}
struct CardView: View {
     let content : String
     @State var isFaceUp = false
     
        
    
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill(.orange)
                Text("😇")
            }
            
            
           
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
