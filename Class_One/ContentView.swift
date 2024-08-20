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

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius:12).foregroundColor(.white)
                RoundedRectangle(cornerRadius:12).strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius:12)
                Text("😇")
            }
            
            
           
        }).foregroundColor(.orange)
    }
}
















#Preview {
    ContentView()
}
