//
//  ViewController.swift
//  signature-touch
//
//  Created by phoenix on 2020/3/7.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        creatAction()
    }

    private func createUI() {
        view.addSubview(showSignatureButton)
        showSignatureButton.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.width.equalTo(300)
        }
    }

    private func creatAction() {
        showSignatureButton.addTarget(self, action: #selector(showSignatureController), for: UIControl.Event.touchUpInside)
    }

    // MARK: getter/setter
    private let showSignatureButton: UIButton = {
        let button = UIButton()
        button.setTitle("打开签名界面", for: .normal)
        button.backgroundColor = .green
        return button
    }()

    // MARK: SystemAction
    @objc private func showSignatureController() {
        let nav = SignatureNavController(rootViewController: SignatureController())
        self.view.window?.rootViewController?.present(nav, animated: true, completion: nil)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
}

