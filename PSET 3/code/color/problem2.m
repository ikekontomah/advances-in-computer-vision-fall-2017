%Problem 2 
%a.
% cie_match_matrix=load("CIEMatch.mat") ;
% cie_rgb_matrix=load("CIE2RGB.mat");
% lms_response_matrix=load("LMSResponse.mat");
% result= cie_rgb_matrix.T*cie_match_matrix.CIEMatch  ;
% result2=cie_match_matrix.CIEMatch ;
% result3=lms_response_matrix.LMSResponse;
% colors_to_use=['r','g','b'] ;
% %i.
% figure 
% title("Color Matching Functions") ;
% hold on 
% x_val=linspace(360,730,(730-360)/5+1) ;
% for ele =1:3
%     plot((360:5:730),result(ele,:),colors_to_use(ele)) 
%     %Title("Color Matching Functions") 
% end
% 
% %ii.
% I=eye(3) ;
% primary_light_spectra=result\I ;
% primary_light_spectra=primary_light_spectra' ;
% figure 
% title("Primary light spectra") ;
% hold on 
% for ele =1:3
%     plot((360:5:730),primary_light_spectra(ele,:),colors_to_use(ele)) 
%     %Title("Color Matching Functions") 
% end
% 
% %iii.
% figure
% title("CIE Color Matching Functions") ;
% hold on 
% for ele =1:3
%     
%     plot(x_val,result2(ele,:),colors_to_use(ele)) 
%     %Title("Color Matching Functions") 
% end 
% 
% %iv.
% figure
% I=eye(3) ;
% primary_light_spectra_CIE=result2\I ;
% primary_light_spectra_CIE=primary_light_spectra_CIE' ;
% title("Primary Light Spectra For CIE Color Space") ;
% hold on 
% for ele =1:3
%     plot(x_val,primary_light_spectra_CIE(ele,:),colors_to_use(ele)) 
%     %Title("Color Matching Functions") 
% end 
% 
% %b.
% figure
% I=eye(3) ;
% lms_response=result3\I ;
% lms_response=lms_response' ;
% title("Primary Light Spectra For LMS Response") ;
% hold on 
% for ele =1:3
%     plot(x_val,lms_response(ele,:),colors_to_use(ele)) 
%     %Title("Color Matching Functions") 
% end 
% Kp=10 ;
% Kd=2 ;
% deltaT= 0.001 ;
% gamma = 8 ;
% m=3 ;
% a0=1 ;
% a1=-2 ;
% a2=1+ Kp*gamma*(deltaT^2) + gamma*Kd*(deltaT/m);
% a3= 0 ;
% a4= 0 ;
% a5= gamma*Kd*(deltaT/m);
% r = roots([a0 a1 a2 a3 a4 -a5]) ;
% k=-0.999+(0.001^2) ;
% roots([-1 1.999 k])
% kp= 10;
% deltaT= 0.001 ;
% kd= 1.1 ;
% ki= 0;
% m= 3 ;
% p= 0.985 ;
% gamma=10 ;
% z = tf([1 0],[1], -1); 
% dt = 0.001;
% hw2th = dt/(z-1) ;
% hc2ap=(gamma*(1-p))/(z-p) ;
% ha2w= dt/(z-1) ;
% hc2a=gamma ;
% hki=(z*deltaT)/(z-1) ;
% H=hc2ap*ha2w*hw2th ;
% pid_controller=kp+(kd/(m*deltaT))*(1-z^(-m)) + hki*ki;
% total_system=pid_controller*H ;
% new_sys=feedback(total_system,1) ;
% step(new_sys)

%PRELAB CODE

% z = tf([1 0], [1], -1) ;
% Kd = 5; 
% Kp = 1.0; 
% dt = 0.001; 
% Gamma = 10; 
% Hsys1 = Gamma*dt*dt*(1/(z-1))*(1/(z-1));
% Hsys1p = ((1-0.95)/(z-0.95))*Hsys1;
% Kpd = Kp + Kd/dt*(z-1)/(z); 
% rlocus(Kpd*Hsys1, Kpd*Hsys1p, linspace(0,1,1000))


%PRELAB 4
% s = tf('s') ;
% gamma = 10;
% p_c = -10;
% K_p= 5.0 ;
% K_d= 0.5 ;
% Hps= -gamma*p_c/(s^3-p_c*s^2 -gamma*p_c*(K_d*s +K_p)) ;
% %bode(Hps)
% pole(Hps)
% step(Hps)
% bode(Hps)

%pset 1
s=tf('s') ;
% k=1 ;
% num= k*(s^(2)+1) ;
% denom = s*(s+2);
% h = num/denom ;
% func = feedback(h,1) ;
% step(func)
% kc=10 ;
% k= 10 ^6 ;
% trans_func = (k*kc)/((s*kc)+kc+k) ;
% step(trans_func)
% r=1;
% c=1 ;
% num = 1/(c*s) ;
% denom = num + r ;
% func=5*(num/denom) ;
% step(func) 

% k_fac= 50;
% num = 200*1000*(s+20) ;

% denom = 20*(s+1)*(s+10)*(s+100)*(s+200) ;
% %denom_2= 1/((s+1)*((0.1*s)+1)*((0.01*s)+1)) ;
% h = num/denom ;
% margin(k_fac*h)
%H=feedback(k_fac*h,1) ;
% bode(H)
%margin(H)
%step(H)
%rlocus(H)
% num = (s+10)*(s+50) ;
% denom = (s+500)*(s+2) ;
% trans_func=-num/denom ;
%step(trans_func)
%rlocus(trans_func)



% k= 115 ;
% tau =.00095;
% alpha = 100;
% val_1=alpha*tau*s ;
% val_2 = tau*s ;
% frac= (val_1+1)/(val_2+1) ;
% h_c = k*frac;
% h_s = 1/((s+1)*((0.1*s)+1)*((0.01*s)+1));
% trans_func = h_c * h_s ;
% margin(trans_func)




% z= 20 ;
% p =200 ;
% k=50 ;
% H_c = (p*(s-z))/(z*(s-p)) ;
% H_s = 1000/((s+1)*(s+10)*(s+100)) ;
% trans_func = k* H_c* H_s ;
% margin(trans_func)

%lab 5 checkoff 4
% R1=22000 ;
% R2=1100 ;
% k=100 ;
% C1=2.2/(1000000) ;
% num=220000*(R1*C1*s+1) ;
% denom =(R1+R2)+R1*R2*C1*s ;
% trans=num/denom ;
% h=(k/s^2)*(300/(s+300)) ;
% margin(h*trans)
%step(trans)
%pole(trans)
%rlocus(trans)
%bode(trans)

%PSET 3 
H_s1=100/((s+1)*(0.01*s+1)) ;
H_s2 = (10^(0.5)*10^6)/(s^2*(10^-5*s+1)) ;
H_s3=exp(-s) ;
H_s4 = 1/(s*(10^-6*s+1)) ;
H_s5= (10^(0.5)*10^4)/((0.1*s+1)*(0.1*s-1)*(0.00001*s+1)) ;
H_s6=10^4*((s^2)/((s+1)^3)) ;
H_c1=1/s ;
H_c2=7*10^7*((10^-7*s+1)/(10^-8*s+1)) ;
H_c3 =10*(2^0.5)*((0.1*s+1)/(s+1)) ;
H_c4= 100 ;
H_c5 = (10^-3*s+1)/(10^-4*s+1) ;
H_c6=10*((10*s+1)/(1000*s+1)) ;
H_c7= 10/(s^2) ;

margin(H_s6*H_c4)
%bode((H_s2*H_c5)/(1+H_s2*H_c5))
%poles=abs(pole((H_s6*H_c4)/(1+H_s6*H_c4)))

% k=1.6 ;
% t=0.1 ;
% H_del= exp(-t*s) ;
% H_p =10/(s+1) ;
% trans_func = feedback(k*H_p,H_del) ;
% %margin(k*H_p*H_del)
% step(trans_func)
% poles = pole(trans_func)