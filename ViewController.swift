//
//  ViewController.swift
//  ScrollViewWithCollectionViews
//
//  Created by Jakob Tak on 2020. 09. 16..
//  Copyright © 2020 Jakob Tak. All rights reserved.
//

import UIKit


//let datas : [nsarray] = [] names랑 colors 대신 어레이 여러개 만들던, nsarray에 넣으시던가 해서 데이터 넘겨주면 됩니다.
let names = ["First","Second","Third","Fourth","Fifth","Sixth","Seventh","Eighth","Nineth","Tenth"]
let colors = [UIColor.red, UIColor.blue, UIColor.purple, UIColor.green, UIColor.yellow, UIColor.cyan, UIColor.systemPink, UIColor.brown, UIColor.systemOrange]

class ViewController: UIViewController {
    
    var emptyViews : [UIView] = []
    var labels : [UILabel] = []
    var collectionViews : [UIViewController] = []
    
    
    //사실 원하는 만큼 콜렉션뷰 만들어서 해당하는 Array #값 넘겨서 만드시면 됩니다.
    //한 10개면 차고 넘쳐보여서...
    let collectionView1 = CollectionViewController1()
    let collectionView2 = CollectionViewController2()
    let collectionView3 = CollectionViewController3()
    let collectionView4 = CollectionViewController4()
    let collectionView5 = CollectionViewController5()
    let collectionView6 = CollectionViewController6()
    let collectionView7 = CollectionViewController7()
    let collectionView8 = CollectionViewController8()
    let collectionView9 = CollectionViewController9()
    let collectionView10 = CollectionViewController10()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionViews에 가져오신만큼 넣어주시고
        collectionViews = [collectionView1,collectionView2,collectionView3,collectionView4,collectionView5,collectionView6,collectionView7,collectionView8,collectionView9,collectionView10]
        
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        var scrollView: UIScrollView!
        //화면을 3사분면일때 (0,-40)에 스크롤뷰 생성
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 40, width: screenWidth, height: screenHeight))
        
        var count = 0
        
        for color in colors{
            
            emptyViews.append(createEmptyView(color))
            labels.append(createLabel(count))
            
            let emptyView = emptyViews[count]
            let label = labels[count]
            let childView = collectionViews[count]
            
            addChild(childView)
            scrollView.addSubview(emptyView)
            emptyView.addSubview(label)
            emptyView.addSubview(childView.view)
            childView.didMove(toParent: self)
            
            //레이블 지저분해보여서 준 마진 값
            //스크롤 뷰가 3사분면일때 (-10, -10)에 레이블 생성
            NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: emptyView, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: emptyView, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
            //뷰의 너비
            NSLayoutConstraint(item: emptyView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 414).isActive = true
            //스크롤뷰의 최상단으로부터의 뷰의 거리
            NSLayoutConstraint(item: emptyView, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: CGFloat((count)*150)).isActive = true
            //뷰의 높이
            NSLayoutConstraint(item: emptyView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150).isActive = true
            
            count += 1
        }
        
        scrollView.contentSize = CGSize(width: screenWidth, height: CGFloat((count)*150+100))
        
        view.addSubview(scrollView)

    }

    func createEmptyView (_ color : UIColor) -> UIView{
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func createLabel (_ index : Int) ->UILabel{
        let label = UILabel()
        label.text = names[index]
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }


}
