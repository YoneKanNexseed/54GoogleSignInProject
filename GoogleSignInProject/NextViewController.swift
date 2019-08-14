//
//  NextViewController.swift
//  GoogleSignInProject
//
//  Created by yonekan on 2019/08/08.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit
import Firebase

class NextViewController: UIViewController {

    @IBOutlet weak var imageVIew: UIImageView!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // ログイン中ユーザー取得
        let user = Auth.auth().currentUser!
        do {
            // URLからプロフィール写真を取得・設定
            let data = try Data(contentsOf: user.photoURL!)
            let image = UIImage(data: data)
            
            // 取得したプロフィール写真を設定
            imageVIew.image = image
            
            // メールアドレスをラベルに設定
            email.text = user.email
            
            // 名前をラベルに設定
            name.text = user.displayName
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }

    }
    
}
