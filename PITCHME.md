# 行列の正則化
2020/01/09 @kotan.kn

---
### ニューラルネットワークでの行列演算
$$XW=Y$$

+++

## 本発表での主張

+++

## $W$ は正則化されるべき

+++

## $W^TW$ は単位行列であるべき

+++

## $W$ の特異値は全て1であるべき

---

### 主張1 $W^TW$ は単位行列であるべき
の理由

+++
### ニューラルネットワークでの特徴量フィルタ1
$$XM=Y$$
  

 - $X$: 入力(行: サンプル次元, 列: 特徴量$\in\mathbb{R}$)
 - $Y$: 出力(行: サンプル次元, 列: 特徴量$\in\mathbb{R}$)
 - $W$: Xの特徴量空間を$\rightarrow$Yの特徴量空間の写像行列

+++
### ニューラルネットワークでの特徴量フィルタ2
$$XM=Y$$
  
  
@math
$\left[\begin{matrix} x_{0,0} & x_{0,1} & \cdots \\ x_{1,0} & x_{1,1} & \cdots \\ \vdots & \vdots & \ddots \end{matrix}\right] \left[\begin{matrix} w_{0,0} & w_{0,1} & \cdots \\ w_{1,0} & w_{1,1} & \cdots \\ \vdots & \vdots & \ddots \end{matrix}\right] = \left[\begin{matrix} y_{0,0} & y_{0,1} & \cdots \\ y_{1,0} & y_{1,1} & \cdots \\ \vdots & \vdots & \ddots \end{matrix}\right]$
@mathend

$$
y_{i,j}=\sum_{k}x_{i,k}w_{k,j}
$$
 - 行列$W$の$j$列目と入力$X$の行ベクトルの相関 
 - 列次数分の$W$フィルタを用意して$X$の特徴量をフィルタリングする 
 - 各種フィルタの効果が似ていると同じ特徴をみてしまい効率が低下する
 - つまり$W$の列ベクトルは **一次独立** であるべき |

+++
### 列ベクトルが一次であるということは
自己相関行列 $W^TW$が **対角行列** であるべき

$$
W^TW=\left[\begin{matrix} 
\lambda_0 & 0 & 0 & \cdots \\
0 & \lambda_1 & 0 & \cdots \\
0 & 0 & \lambda_2 & \cdots \\
\vdots & \vdots & \vdots & \ddots
\end{matrix}\right]
$$

