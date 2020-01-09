Python=3.7.5  
TensorFlow-GPU=2.0.0  
Matplotlib=3.1.1  

# 構成
 - Regular.ipynb: 特異値正則化つきの層定義
   - RegDense: KerasのDenseクラス互換な結合層
   - RegConv2D: KerasのConv2Dクラス互換な畳み込み層
 - MNIST-DCGAN.ipynb: 数値実験用ノート
   - 各種の正則化を用いてMNISTデータセットについてDCGANするノート
   - モデル定義は旧Keras公式のサンプル等からの写経
