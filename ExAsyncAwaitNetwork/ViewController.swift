//
//  ViewController.swift
//  ExAsyncAwaitNetwork
//
//  Created by 김종권 on 2022/11/28.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
//    Task {
//      await fetchItems()
//    }
//
//    DispatchQueue.global().async {
//      self.fetchHeavyItems()
//    }
//
//    print("will enter task block")
//    Task {
//      print("did enter task block")
//      try? await Task.sleep(for: .seconds(10)) // await를 만남 -> 다음 라인의 코드 실행시키지 않고 대기
//      print("will out task block")
//    }
//    print("some another code")
    
    // 5초 소요
//    Task {
//      async let a = getA()
//      async let b = getB()
//      await print(a + b)
//    }
//
//    // 8초 소요
//    Task {
//      let a = await getA()
//      let b = await getB()
//      print(a + b)
//    }
    
    let counter = Counter(name: "counter")
//    counter.plus()
    Task {
      await counter.plus()
    }
    counter.getName()
  }
  
  func fetchItems() async {
    
  }
  
  func fetchHeavyItems() {
    // get some heavy items
    
  }
  
  func getA() async -> Int {
    try? await Task.sleep(for: .seconds(3))
    return 3
  }
  
  func getB() async -> Int {
    try? await Task.sleep(for: .seconds(5))
    return 5
  }
}

actor Counter {
  private let name: String
  private var count = 0
  
  init(name: String) {
    self.name = name
  }
    
  func plus() {
    count += 1
  }
  
  nonisolated func getName() -> String { // <-
    name
  }
}

