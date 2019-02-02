//
//  QuizViewController.swift
//  Quiz
//
//  Created by コジマ・ショウゴ on 2019/01/05.
//  Copyright © 2019年 コジマ・ショウゴ. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

   //問題文を格納する配列
    var quizArray = [Any]()
    
    //正解数
    var correctAnswer: Int = 0
    
    
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //一時的にクイズを格納していく配列
    var tmpArray = [Any]()
        //tmpArrayに問題文、3つの選択肢、答えの番号が入った配列を追加していく
        tmpArray.append(["Appleの2015年現在のCEOの名前は？","スティーブジョブス","ティム・クック","ジョナサン・アイブ",2])
        tmpArray.append(["iphone6s,iphone6s plusから新たに導入された画面タッチの指の圧力を検出する機能をなんという？","3Dタッチ","2Dタッチ","スーパータッチ",1])
        tmpArray.append(["iPod touchのモデルの中で最大容量のものは何GB？","64GB","128GB","160GB",2])
        tmpArray.append(["1985年、Appleを追放されたスティーブジョブスが立ち上げた会社の正式名称は？","NEXt,Inc","NExT,Inc","NeXT,Inc",3])
        tmpArray.append(["2015年9月30日にリリースされたOSXの名前は？","El Captain","El Capitan","ElCapital",2])
        tmpArray.append(["Apple Watchはiphoneとどんな通信方法でペアリンされる？","FM電波","Wi-Fi","Bluetooth",3])
        
        
        //問題をシャッフルしてquizArrayに格納する
        while (tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
            
        }
        
        choiceQuiz()
        
    }
    
        
    // Do any additional setup after loading the view.
    

    func choiceQuiz() {
        //一時的にクイズを取り出す配列
        let tmpArray = quizArray[0] as! [Any]
        //問題文のテキストを表示
        quizTextView.text = tmpArray[0] as! String
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    
    @IBAction func choiceAnswer(sender: UIButton) {
        let tempArray = quizArray[0] as![Any]
        if tempArray[4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer = correctAnswer + 1
        }
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        //解いた問題の合計数があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
//            performSegueToResult()
        }else{
            choiceQuiz()
         }
        }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    //セグエを準備（prepare）するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
            
        
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

