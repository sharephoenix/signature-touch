//
//  SignatureNavController.swift
//  signature-touch
//
//  Created by phoenix on 2020/3/7.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SignatureNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .fullScreen
        setNavigationBarHidden(true, animated: false)
    }

    override var shouldAutorotate: Bool {
        return true
    }

      override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
          return .landscapeRight
      }

      override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
          return .landscapeRight
      }

}
