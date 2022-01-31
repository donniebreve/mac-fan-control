import SwiftUI

struct AboutView: View {
    var body: some View {
        HStack{
            //Image(nsImage:NSImage(named:NSImage.Name("keyboard_128"))!).padding()
            VStack {
                Text("Mac Fan Curve").font(.title)
                Text("Version 0.1")
                Text("A lightweight application to control your Macbook fan(s).")
                    .font(Font.system(size: 10))
                    .italic()
                    .frame(minWidth: 0, idealWidth: 0, maxWidth: 200, minHeight: 0, idealHeight: 0, maxHeight: 50, alignment: .center)
                    .padding()
                Button(
                    action: {
                        if let url = URL(string: "https://github.com/donniebreve/mac-fan-curve") {
                            NSWorkspace.shared.open(url)
                        }
                    },
                    label: {
                        Text("github")
                    })
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
