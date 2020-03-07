//
//  SignautreBoxView.swift
//  signature-touch
//
//  Created by phoenix on 2020/3/7.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import SnapKit

class SignautreBoxView: UIView {

    // 回调方法
    public var saveCallback: ((UIImage?) -> Void)?
    public var dismissCallback: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        createUI()
        createAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK -PrivateAction
    private func createUI() {
        addSubview(leftTopTitle)
        addSubview(dismissButton)
        addSubview(resetButton)
        addSubview(saveButton)
        addSubview(signatureContentView)

        leftTopTitle.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(8)
            make.top.equalTo(self.snp.top).offset(16)
        }
        dismissButton.snp.makeConstraints { make in
            make.leading.equalTo(leftTopTitle.snp.trailing).offset(8)
            make.centerY.equalTo(leftTopTitle.snp.centerY)
        }
        saveButton.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.bottom.equalTo(self.snp.bottom).offset(-8)
            make.width.equalTo(110)
        }
        resetButton.snp.makeConstraints { make in
            make.trailing.equalTo(saveButton.snp.leading).offset(-8)
            make.bottom.equalTo(saveButton.snp.bottom)
            make.width.equalTo(110)
        }
        signatureContentView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(8)
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.top.equalTo(leftTopTitle.snp.bottom).offset(8)
            make.bottom.equalTo(saveButton.snp.top).offset(-8)
        }
    }

    private func createAction() {
        saveButton.addTarget(self, action: #selector(getImage), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetCavcas), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }

    @objc private func getImage() {
        let image = signatureContentView.savePic()
        saveCallback?(image)
    }

    @objc private func resetCavcas() {
        signatureContentView.cleanAll()
    }

    @objc private func dismissAction() {
        dismissCallback?()
    }

    // MARK -getter/setter
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("返回", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        return button
    }()

    private let leftTopTitle: UILabel = {
        let label = UILabel()
        label.text = "请签署您的名字"
        return label
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("保存签名", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        return button
    }()

    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("重置签名", for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 3
        button.layer.masksToBounds = true
        return button
    }()

    private let signatureContentView: SignautreView = {
        let view = SignautreView()
        return view
    }()
}
