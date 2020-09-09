//
//  MemoViewController.swift
//  MemoPad
//
//  Created by esaki yuki on 2020/09/09.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    //ユーザーデフォルトにアクセスするためにsaveDataという名前のインスタンスを作る
    //let saveData: UserDefaults = UserDefaults.standard
    
    //ユーザーデフォルトに鍵を使って値を書き込む方法
    //saveData.set(書き込みたい変数, forKey: "キー")
    
    //鍵を使って値を取り出す
    //取り出したいもの = saveData.object(forKey: "キー")
    
    //アラートを作る公式
    //let alert: UIAlertController = UIAlertController(title: "タイトル", message: "本文を入れます。", preferredStyle: .alert)
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    //ユーザーデフォルトにアクセスするためにsaveDataという名前のインスタンスを作る
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //鍵を使って値を取り出す
        //String型に変換
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        
        titleTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveMemo() {
        //ユーザーデフォルトに鍵を使って値を書き込む
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            //navigationControllerで前の画面に戻る時の公式
            self.navigationController?.popViewController(animated: true)}))
        
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
