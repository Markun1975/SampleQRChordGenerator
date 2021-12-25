//
//  ViewController.swift
//  SampleQRChordGenerator
//
//  Created by Masaki on R 3/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var githubImageView: UIImageView!
    @IBOutlet weak var snsImageView: UIImageView!
    
    let twitterUrlStr = "https://twitter.com/mark_1975M"
    let githubUrlStr = "https://github.com/Markun1975"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setURL()
    }
    
    func setURL(){
        QRGenerator(url: twitterUrlStr, uiImage: snsImageView)
        QRGenerator(url: githubUrlStr, uiImage: githubImageView)
    }
    
    func QRGenerator(url: String, uiImage: UIImageView){
        let url = url
        // NSString から NSDataへ変換
        let data = url.data(using: String.Encoding.utf8)!
        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10) // 白枠をつける
        uiImage.image = UIImage(ciImage:qr.outputImage!.transformed(by: sizeTransform))
    }


}

