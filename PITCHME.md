# 行列の正則化
2020/01/09 @kotan.kn

---
### ニューラルネットワークでの行列演算
$$XW=Y$$
 - $X$: 入力(行=標本, 列=特徴量)
 - $W$: 重み行列=特徴フィルタの集合
 - $Y$: 出力=フィルタされた入力(行=標本, 列=特徴量)

+++

## 本発表での主張

+++  

## 各層の$W$について$W^TW$ はできるだけ単位行列になるよう正則化されるべき
($W$が正方行列なら$W$は直交行列になるべき)

+++  
### ニューラルネットワークでの特徴量フィルタ1
$$XW=Y$$
  
 - $X$: 入力(行: サンプル次元, 列: 特徴量$\in\mathbb{R}$)
 - $Y$: 出力(行: サンプル次元, 列: 特徴量$\in\mathbb{R}$)
 - $W$: $X$の特徴量空間$\rightarrow$$Y$の特徴量空間の写像行列

+++
### NNでの特徴量フィルタ2
`$$\left[\begin{matrix} 
x_{0,0} & x_{0,1} & \cdots \\ 
x_{1,0} & x_{1,1} & \cdots \\ 
\vdots & \vdots & \ddots 
\end{matrix}\right]
\left[\begin{matrix} 
w_{0,0} & w_{0,1} & \cdots \\ 
w_{1,0} & w_{1,1} & \cdots \\ 
\vdots & \vdots & \ddots 
\end{matrix}\right] = 
\left[\begin{matrix} 
y_{0,0} & y_{0,1} & \cdots \\ 
y_{1,0} & y_{1,1} & \cdots \\ 
\vdots & \vdots & \ddots 
\end{matrix}\right]$$`

+++

`$$
y_{i,j}=\sum_{k}x_{i,k}w_{k,j}
$$`

 - 行列$W$の$j$列目と入力$X$の行ベクトルの相関 
 - 列次数分の$W$フィルタを用意して$X$の特徴量をフィルタリングする 
 - 各種フィルタの効果が似ていると同じ特徴をみてしまい効率が低下する
 - つまり$W$の列ベクトルは **一次独立** であるべき |

+++
### 列ベクトルが一次独立であるということは
自己相関行列 $W^TW$が **対角行列** であるということ

`$$
W^TW=\left[\begin{matrix} 
\lambda_0 & 0 & 0 & \cdots \\
0 & \lambda_1 & 0 & \cdots \\
0 & 0 & \lambda_2 & \cdots \\
\vdots & \vdots & \vdots & \ddots
\end{matrix}\right]
$$`

+++  

### 自己相関行列$W^TW$の対角成分のスケールは同じ幅であるべき
 - 対角成分=特徴フィルタのノルム
 - ノルムにばらつきがあると出力される特徴量のスケールもばらける
 - フィルタのノルムが異なる=共変量シフトの原因

+++  

### 自己相関行列$W^TW$の対角成分のスケールは1に近いべき
NNでは多層化された行列演算が通例  
$F(WX_0)=X_1,~F(WX_1)=X_2,~F(WX_2)=X_3,~\cdots$
  
各層で特徴量のスケーリングに差異があるとデメリットしかない
 - 層の重みの負担率がばらける  
 - ヘッセ行列が歪み学習が難しくなる

+++  

### 自己相関行列$W^TW$の固有値は$1$に近いべき
  
$F(W X_{t} )=X_{t+1}$
  
 - 特にRNNでは出力が再起する
   - 
   - 大きい固有値に対応したベクトルばかり強調される
     - $1$以上だと発散する
 - $W^TW$の固有値 $=$ $W$の特異値の二乗
 - $W$の特異値が全て$1$ならば良い
  
---  

## ところで

+++  

 - 自己相関行列が単位行列 
 - 特異値が全て1
 - この二つは等価である | 

+++  

証明  

+++  

$W=U\Sigma V^T$
のとき
$W^TW=(U\Sigma V^T)^T(U\Sigma V^T)=V\Sigma^TU^TU\Sigma V^T$
  
+++  

$W^TW=V\Sigma^TU^TU\Sigma V^T$  
$U$は直交行列なので$U^TU=I$  
$\Sigma$は対角行列なので$\Sigma^T\Sigma=\Sigma^2$  
すなわち$W^TW=V^T\Sigma^2V$  
  
加えて$V$も直交行列なので  
$W^TW=V^T\Sigma^2V=I$になる条件は$\Sigma=I$  

+++  

つまり，$W^TW$を単位行列に近づけること  
=Wの特異値を全て$1$に正則化すること

---    

# 数値実験
正則化の影響で過学習を防ぎ各フィルタを効率的に用いているか分析
 - モデル: DCGAN
   - 理想的には正則化
 - データセット: MNIST(Fashion-MNIST)
 - その他実験条件: 割愛(ipynb参照)

+++  

+++  

+++  

+++  

#### 各epochごとの学習段階で生成される画像

+++  

#### おまけ
同じモデルでFashion-MNISTも試した

+++  

#### 各epochごと学習段階で生成される画像

| 正則化なし | L2正則化 | 特異値正則化 |
|:--------:|:-------:|:----------:|
| ![X](https://github.com/sonitus/singular-regularization-pitch/blob/draft/assets/img/rout.gif?raw=true) | ![Y](https://github.com/sonitus/singular-regularization-pitch/blob/draft/assets/img/lout.gif?raw=true) | ![Z](https://github.com/sonitus/singular-regularization-pitch/blob/draft/assets/img/qout.gif?raw=true) |

正則化があればmode collapseは発生しない  