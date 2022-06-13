import SwiftUI

struct ContentView: View {
    @State private var arrayOfElements = [ElementView]()
    
    var body: some View {
        VStack {
            
            //ElementView
            ForEach(Array(zip(arrayOfElements.indices, arrayOfElements)), id: \.0) { index, element in
                Button {
                    if index == 0 {
                        arrayOfElements[index].value += arrayOfElements[4].value
                    } else {
                        arrayOfElements[index].value += arrayOfElements[index - 1].value
                    }
                } label: {
                    element.self
                        .transition(.slide)
                }
                .buttonStyle(.plain)
                
                //Separator
                if element != arrayOfElements.last {
                    Divider()
                }
            }
            
            Spacer()
            
            // Start Button section
            StartButtonView(arrayOfElements: $arrayOfElements)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
