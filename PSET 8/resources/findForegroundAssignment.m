function theta_vals_array=findForegroundAssignment(x_vals,y_vals)

    theta_vals_array=[];
    for ele=2:length(x_vals)-1
        x1=x_vals(ele-1);
        y1=y_vals(ele-1);
        x2=x_vals(ele);
        y2=y_vals(ele);
        x3=x_vals(ele+1);
        y3=y_vals(ele+1);
        theta_vals=find_angle(x1,y1,x2,y2,x3,y3) ; 
        theta_vals_array(end+1)=theta_vals ;
    end 
        theta_vals_array=theta_vals_array';
end
function get_vectors = find_angle(x1,y1,x2,y2,x3,y3)
    vec_Ax=x2-x1 ;
    vec_Ay=y2-y1 ;
    vec_Bx=x3-x1 ;
    vec_By=y3-y1 ;
    adotb=vec_Ax*vec_Bx+vec_Ay*vec_By ;
    magA=sqrt(vec_Ax.^2+vec_Ay.^2) ;
    magB=sqrt(vec_Bx.^2+vec_By.^2) ;

    cross_prod=vec_Ax*vec_By-vec_Bx*vec_Ay ;
    if cross_prod > 0
        find_theta=-(180-acos(adotb/(magA*magB)));
    else
        find_theta=(180-acos(adotb/(magA*magB)));   
        
    end
     R = [cos(find_theta/2) -sin(find_theta/2); sin(find_theta/2) cos(find_theta/2)];
     vec_2=[x3-x1 y3-y1] ;
     matr=vec_2*R ;
     get_vectors = matr(1) ;
end
