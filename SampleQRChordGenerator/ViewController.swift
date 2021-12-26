//
//  ViewController.swift
//  SampleQRChordGenerator
//
//  Created by Masaki on R 3/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    //QRコードを設置するためのUIImageViewを定義
    @IBOutlet weak var githubImageView: UIImageView!
    @IBOutlet weak var snsImageView: UIImageView!
    
    let twitterUrlStr = "https://twitter.com/mark_1975M"
    let githubUrlStr = "https://github.com/Markun1975"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setURL() //各URLを設定した、生成メソッドを呼ぶ
    }
    
    //URLを設定する
    func setURL(){
        generateQR(url: twitterUrlStr, uiImage: snsImageView)
        generateQR(url: githubUrlStr, uiImage: githubImageView)
    }
    
    //QRコードを生成する
    func generateQR(url: String, uiImage: UIImageView){
        let url = url
        // urlをString から Dataへ変換
        let data = url.data(using: .utf8)!
        // ※inputCorrectionLevelは、誤り訂正のレベルを指定するもの
        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": "M"])!
        let sizeTransform = CGAffineTransform(scaleX: 1, y: 1)
        uiImage.image = UIImage(ciImage:qr.outputImage!.transformed(by: sizeTransform))
    }
}

