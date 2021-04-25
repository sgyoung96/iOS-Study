//
//  ContentView.swift
//  DadJokes
//
//  Created by Gayeong on 2021/03/29.
//

import SwiftUI

// 구조체 선언. 구조체 사용의 이유가 뭘까? -> 책보고 공부하기 (완) : 구조체를 클래스보다 권장한다.
// 상속이 필요하거나 데이터가 캡슐화된하나의 인스턴스가 필요할 때는 클래스 사용.
// 인스턴스가 소멸될 때 리소스를 확보하기 위한 작업이 필요할 때도 클래스 사용. (구조체는 deinit() 소멸자가 없음.)
/*
struct Joke {
    var setup: String
    var punchline: String
    var rating: String
}
*/
struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Joke.entity(), sortDescriptors: [
                    NSSortDescriptor(keyPath: \Joke.setup, ascending: true)
    ]) var jokes: FetchedResults<Joke>
    @State private var showingAddJoke = false
    /*
    // 구조체를 변수에 할당하는데, 이 변수는 배열의 형식이다. 배열이기 때문에 여러 구조체를 가질 수 있다.
    let jokes/*: [Joke] -- 같은 것*/ = [
        Joke(setup: "What's a cow's favorite place?", punchline: "A mooseum.", rating: "Silence"),
        Joke(setup: "What's brown and sticky?", punchline: "A stick.", rating: "Sigh"),
        Joke(setup: "What's orange and sounds like a parrot?", punchline: "A carrot", rating: "Smirk")
    ]
    */
    var body: some View {
        /*
        List {
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
        }
        */
        /*
        // TableView 실습 예제
        List {
        ForEach(jokes, id: \.setup /* id를 식별하는 법 = \. 아이디 */) { joke in
            HStack{
                EmojiView(for: joke.rating)
                Text(joke.setup) // joke의 setup에 입력한 값 출력
            }
        } // Foreach문은 고차함수. for in과 차이가 있다. 이것은 return으로 빠져나온다.
        // ForEach(반복 돌 것; 배열) { 담은 변수 선언 in 실행구문(텍스트를 뿌린다. 담은 변수의 setup이라는 부분을.)  }
        /*
         (11db) p joke
         (DadJokes.Joke) $R2 = (setup = "What\'s brown and sticky?", punchline = "A stick.", rating = "Sigh")
         이런 식으로 변수에 구조체가 하나씩 들어간다.
         */
        }
        */
        /*
        // Navigation 실습
        NavigationView {
            List {
                ForEach(jokes, id: \.setup /* id를 식별하는 법 = \. 아이디 */) { joke in
                    NavigationLink(destination: Text(joke.punchline)) {
                        EmojiView(for: joke.rating)
                        Text(joke.setup) // joke의 setup에 입력한 값 출력
                    }
                }
            }
            .navigationBarTitle("All Groan Up")
        }
        */
        NavigationView {
            List {
                ForEach(jokes, id: \.setup) { joke in
                    NavigationLink(destination: Text(joke.punchline)) {
                        EmojiView(for: joke.rating)
                        Text(joke.setup)
                    }
                }
            }
            .navigationBarTitle("All Groan Up")
            .navigationBarItems(trailing: Button("Add") {
                self.showingAddJoke.toggle()
            })
            .sheet(isPresented: $showingAddJoke) {
                AddView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
