import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }

       
        
        
        
        
    }
} // The struct content view behaves like a View
 // Some view returns a the data in it

// if there is var in a struct you must provide the value
// You can do local variables in View Structs
// View Builder can only do conditionals, local variable assignments, lists

struct CardView: View {
     @State var isFaceUp = false
    
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                base.fill(.orange)
                Text("😇")
            }
            
            
           
        }.onTapGesture{
            if isFaceUp == true {
                isFaceUp = false
            } else {
                isFaceUp = true
            }
            
            
        }
    }
}
















#Preview {
    ContentView()
}
