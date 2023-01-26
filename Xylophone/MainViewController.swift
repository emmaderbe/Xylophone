//
//  ViewController.swift
//  Xylophone
//
//  Created by Дербе Эмма on 25.01.2023.
//

import UIKit
import AVFoundation

//class ViewController: UIViewController {
//    private var player: AVAudioPlayer!
//    
//    private let stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.alignment = .center
//        stack.distribution = .fillEqually
//        stack.spacing = 8
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .brown
//        view.backgroundColor = .white
//        view.addSubview(stackView)
////        setupView()
//        setConstraints()
//        setupKeys()
//    }
//}
//
//extension ViewController {
////    private func setupView() {
////        view.backgroundColor = .white
////        view.addSubview(stackView)
////    }
//    
//    private func setupKeys() {
//        let width = UIScreen.main.bounds.width
//        let labels = ["C", "D", "E", "F", "G", "A", "B"]
//        for i in labels.indices {
//          let button = UIButton()
//          let label = labels[i]
//          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
//          button.backgroundColor = UIColor.init(named: label)
//          button.setTitle(label, for: .normal)
//          button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
//          button.layer.cornerRadius = 10
//          button.translatesAutoresizingMaskIntoConstraints = false
//          button.widthAnchor.constraint(equalToConstant: width * (1 - CGFloat(i + 3) * 0.035)).isActive = true
//          stackView.addArrangedSubview(button)
//        }
//    }
//    
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//          stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//          stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//          stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//          stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        ])
//    }
//}
//
//
//extension ViewController {
//    func playSound(_ title: String) {
//        guard let url = Bundle.main.url(forResource: title, withExtension: "wav") else { return }
//      player = try! AVAudioPlayer(contentsOf: url)
//      player.play()
//    }
//    
//    @objc func keyPressed(_ sender: UIButton) {
//      if let title = sender.currentTitle { playSound(title)}
//    }
//}

class MainViewController: UIViewController {

  let stack: UIStackView = {
    $0.axis = .vertical
    $0.alignment = .center
    $0.distribution = .fillEqually
    $0.spacing = 8
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
  }(UIStackView())
  
  var player: AVAudioPlayer!

  func playSound(_ title: String) {
      guard let url = Bundle.main.url(forResource: title, withExtension: "wav") else { return }
    player = try! AVAudioPlayer(contentsOf: url)
    player.play()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(stack)
    setupConstraints()
    setupKeys()
  }
  func setupConstraints() {
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    ])
  }
  func setupKeys() {
    let width = UIScreen.main.bounds.width
    let labels = ["C", "D", "E", "F", "G", "A", "B"]
    for i in labels.indices {
      let button = UIButton()
      let label = labels[i]
      button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
      button.backgroundColor = UIColor.init(named: label)
      button.setTitle(label, for: .normal)
      button.addTarget(self, action: #selector(keyPressed), for: .touchUpInside)
      button.layer.cornerRadius = 10
      button.translatesAutoresizingMaskIntoConstraints = false
      button.widthAnchor.constraint(equalToConstant: width * (1 - CGFloat(i + 3) * 0.035)).isActive = true
      stack.addArrangedSubview(button)
    }
  }
  @objc func keyPressed(_ sender: UIButton) {
    if let title = sender.currentTitle { playSound(title)}
  }
}


 
