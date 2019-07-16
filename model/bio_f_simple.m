function [f]=bio_f_simple(p)
% Diferential Equations
%
% S1'(t) = D(t) * ( S1in(t) - S1(t) ) - p10 * v1(S1(t)) * x1(t)
% S2'(t) = D(t) * ( S2in(t) - S2(t) ) + p11 * v1(S1(t)) * x1(t) - p12* v2(S2(t)) * x2(t)
%
% v1(S1(t)) =        p1 * S1(t)
%             -------------------------
%             p2 + S1(t) + p3 * S1(t)^2
%
% v2(S2(t)) =        p4 * S2(t)
%             -------------------------
%             p5 + S2(t) + p6 * S2(t)^2
%
% Gas flow (CH4 e CO2)
%
% qm(t) = p13 * v2(S2(t)) * x2(t) + p15 * C(t)

v1=@(S1) S1;

v2=@(S2) p(3)*S2/(p(4)+(p(3)-2)*S2+S2^2/p(4));

f=@(x,t,u)  [u-p(1)*v1(x(1));
           +p(2)*v1(x(1))-p(5)*v2(x(2))]
              
    
