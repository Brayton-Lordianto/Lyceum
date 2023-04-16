//
//  MyContentView.swift
//  OpenAI chat-dalle
//
//  Created by Brayton Lordianto on 4/15/23.
//

import SwiftUI
import StoreKit

// set up view model for payment
class PaymentViewModel: ObservableObject {
    @Published var products: [Product] = []
    func fetchProducts() {
        Task {
            let products = try! await Product.products(for: ["com.coins"])
            print(products)
            DispatchQueue.main.async {
                self.products = products
            }
        }
    }

    func purchase() {
        Task {
            let transaction = try! await products.first!.purchase()
            print(transaction)
        }
    }
}

struct MyContentView: View {
    @StateObject var gameManager = GameManager()
    @StateObject var paymentVM = PaymentViewModel()

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .onAppear {
                    paymentVM.fetchProducts()
                }
            
            Text("Payment")
                .onTapGesture {
                    paymentVM.purchase()
                }
            

            if gameManager.isGameOver {
                Text("Game Over")
            } else if gameManager.inGame {
                GameView(gameManager: gameManager)
            } else {
                VStack {
                    Button("Authenticate") {
                        gameManager.authenticateUser()
                    }
                    
                    Button("Start Game") {
                        gameManager.startMatching()
                    }
                    Text("Not in Game")
                }

            }
        
        }
    }
}

struct MyContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyContentView()
    }
}
