% 6.869 Advances in Computer Vision
% Problem Set 3

function magnified = magnifyChange(im1, im2, magnificationFactor)
    % find phase shift in frequency domain
    im1Dft = fft2(im1)
    im2Dft = fft2(im2)
    angle_dft1=angle(im1Dft) ;
    angle_dft2=angle(im2Dft) ;
    %phaseShift = rad2deg(abs(angle_dft2-angle_dft1)) ;
    phaseShift = angle_dft2-angle_dft1;
                
    %phaseShift=checkPositive(phaseShift)
    % magnify the phase change in frequency domain
     magnifiedDft=im1Dft.*exp(magnificationFactor*phaseShift*1j);
    
    % what does the magnified phase change cause in image space?
    magnified = ifft2(magnifiedDft) ;
    end
 
   
   

  

 