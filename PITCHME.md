# 行列の正則化
2020/01/09 @kotan.kn

---
### ニューラルネットワークでの行列演算
$$XW=Y$$

+++

# 本発表での主張
## $W$ は正則化されるべき

+++

# 本発表での主張1
## $W^TW$ は単位行列であるべき

+++

# 本発表での主張2
## $W$ の特異値は全て1であるべき

---
### ニューラルネットワークでの特徴量フィルタ1
$$XM=Y$$
  

 - $X$: 入力(行: サンプル次元, 列: 特徴量$\in\mathbb{R}$)
 - $Y$: 出力(行: サンプル次元, 列: 特徴量$\in\mathbb{R}$)
 - $W$: 空間写像行列: (Xの特徴量空間を$\rightarrow$Yの特徴量空間)

---
### ニューラルネットワークでの特徴量フィルタ2
$$XM=Y$$
  
  
$$
\left[\begin{matrix} 
x_{0,0} & x_{0,1} & \cdots \\
x_{1,0} & x_{1,1} & \cdots \\
\vdots & \vdots & \ddots
\end{matrix}\right]
\left[\begin{matrix} 
w_{0,0} & w_{0,1} & \cdots \\
w_{1,0} & w_{1,1} & \cdots \\
\vdots & \vdots & \ddots
\end{matrix}\right]
=
\left[\begin{matrix} 
y_{0,0} & y_{0,1} & \cdots \\
y_{1,0} & y_{1,1} & \cdots \\
\vdots & \vdots & \ddots
\end{matrix}\right]
$$
  

$$
y_{i,j}=\sum_{k}x_{i,k}w_{k,j}
$$
 - 行列$W$の$j$列目と入力$X$の行ベクトルの相関 
 - 列次数分の$W$フィルタを用意して$X$の特徴量をフィルタリングする
 - $W$の行ベクトルは1次元


p4

---

p5

---

p6

---
### 自己相関行列と特異値
行列$M$の特異値分解は$\bf{U\Sigma V^T}$

---
p8

---
p9
