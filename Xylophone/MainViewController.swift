//
//  ViewController.swift
//  Xylophone
//
//  Created by Дербе Эмма on 25.01.2023.
//

import UIKit
import AVFoundation

//MARK: - object and viewController
class MainViewController: UIViewController {
    private var player: AVAudioPlayer!
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
        setupKeys()
    }
}

//MARK: - rendering function
extension MainViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(stackView)
    }
    
    private func setupKeys() {
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
          stackView.addArrangedSubview(button)
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
          stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
          stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
          stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

//MARK: - function about sound
extension MainViewController {
    func playSound(_ title: String) {
        guard let url = Bundle.main.url(forResource: title, withExtension: "wav") else { return }
      player = try! AVAudioPlayer(contentsOf: url)
      player.play()
    }
    
    @objc func keyPressed(_ sender: UIButton) {
      if let title = sender.currentTitle { playSound(title)}
    }
}


