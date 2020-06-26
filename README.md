# SteeringSimulation

## 概要
ステアリングの入力から角速度の伝達関数（または状態方程式）とセンサのモデルをきちんと設計できれば、白線追従のゲインをPIDチューナーで自動調整できるかもしれないっていうやつ。
![overview](https://github.com/shimotoriharuki/SteeringSimulation/blob/master/pic/overview.png )

## センサモデル
θ = 0付近ではセンサのAD値は線形に近似できるのでは？線形でなくても自動調整に任せれば勝手に線形化してくれるのでは？
という仮定。以下はとりあえず適当に作ったセンサのモデル。
```
function [AD1, AD2] = fcn(theta)
    F_ad1 = theta * 500;
    F_ad2 = -theta * 500;
    
    ad1 = 0;
    ad2 = 0;
    if theta > 0
        ad1 = F_ad1;
    elseif theta <= 0
        ad1 = 0; 
    end
    
    if theta >= 0
        ad2 = 0;
    elseif theta < 0
        ad2 = F_ad2; 
    end

    AD1 = ad1;
    AD2 = ad2;
end

```
## ステアリングモデル
ステアリング実機を無限に回転できる実験装置でシステム同定すれば簡単に同定できるのでは？という仮定。

## PID調整器で自動調整
あとは好きなようにゲインを調整できる。
![pid](https://github.com/shimotoriharuki/SteeringSimulation/blob/master/pic/pid.png )
