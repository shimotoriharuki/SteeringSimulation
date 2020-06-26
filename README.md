# SteeringSimulation

## 概要
センサステアの伝達関数（または状態方程式）とセンサのモデルをきちんと設計できれば、PIDチューナーで自動調整できるかもしれないっていうやつ。
![overview](https://github.com/shimotoriharuki/SteeringSimulation/blob/master/pic/overview.png )

## センサモデル
θ = 0付近ではセンサのAD値は線形に近似できるのでは？線形でなくても自動調整に任せれば勝手に線形化してくれるのでは？
という仮定。
```
function [AD1, AD2] = fcn(theta)
    %{
    左右のAD値はθ = 0付近では線形に変動するとしている。AD値を実験データから求めた
    近似解の方程式に置き換えればPIDチューニングが可能かも？
    また、ステアリングの伝達関数（または状態方程式）は無限に回転できる実験台に取り付けて
    システム同定すれば良いかも？
    %}

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

## PID調整器で自動調整
あとは好きなようにゲインを調整できる。
![pid](https://github.com/shimotoriharuki/SteeringSimulation/blob/master/pic/pid.png )



