//
//  ViewController.swift
//  ImageZoomView
//
//  Created by Lincoln Nguyen on 2/11/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // pictureTest = ImageZoomView(frame: <#T##CGRect#>, image: <#T##UIImage#>)
        let pictureTest = ImageZoomView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), image: UIImage(named: "IMG_0448.PNG")!)
        view.addSubview(pictureTest)
    }


}

