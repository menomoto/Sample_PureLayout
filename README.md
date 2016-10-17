# Sample_PureLayout

## NoStoryBoard
StoryBoardを利用しない必要最低限のテンプレート。まずはこれをベースにPureLayoutを学ぶと良い
- Main.StoryBoard削除
- main.swift追加
- appDelegate.swift修正
- info.plist, assets, appDelegateを /Application配下に
- Build Setting(Use Legacy Swift Language Version: Yes）
- ディレクトリ構成
<pre>
 NoStoryBoard
  ├─ Application
  ├─ Compornents
  ├─ Frameworks
  └─ UI
</pre>


## pureLayoutSample01
PureLayoutのサンプル（基本的なView）。git clone後に「make update」が必要です。
- UISearchBar
- UILabel
- UITextField
- UIImageView

![サンプル](http://i.imgur.com/MR8S9oH.png "サンプル")


## pureLayoutSample02
PureLayoutのサンプル（TableView）
- UITableView
- UITableViewCell

![サンプル](http://i.imgur.com/6WWDlLR.png "サンプル")


## pureLayoutSample03
PureLayoutのサンプル（CollectionView）
- UICollectionView
- UICollectionViewCell

![サンプル](http://i.imgur.com/TRPnPGp.png "サンプル")
