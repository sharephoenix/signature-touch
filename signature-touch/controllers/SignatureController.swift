//
//  SignatureController.swift
//  signature-touch
//
//  Created by phoenix on 2020/3/7.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SignatureController: UIViewController {

     private let signautreView: SignautreBoxView = {
        let view = SignautreBoxView()
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.green.cgColor
        return view
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "签名"
        modalPresentationStyle = .fullScreen
        createUI()
        createAction()
    }

    private func createUI() {
        view.addSubview(signautreView)
        view.addSubview(resultImageView)
        signautreView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        signautreView.backgroundColor = .white

        resultImageView.snp.makeConstraints { make in
            make.trailing.equalTo(view.snp.trailing).offset(-8)
            make.top.equalTo(view.snp.top)
            make.width.equalTo(300)
            make.height.equalTo(200)
        }
    }

    private func createAction() {
        signautreView.dismissCallback = { [weak self] in
            self?.dismissController()
        }
        signautreView.saveCallback = { [weak self] image in
            self?.resultImageView.image = image
        }
    }

    @objc func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: getter/setter
    private let resultImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.layer.borderWidth = 2
        imageview.layer.borderColor = UIColor.yellow.cgColor
        return imageview
    }()

    // MARK: SystemAction
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        signautreView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
}
