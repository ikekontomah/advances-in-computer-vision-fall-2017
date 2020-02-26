function marginal_probabilities=belief_Propagation(x_vals,y_vals)
x_coord=findForegroundAssignment(x_vals,y_vals);
y_coord=findForegroundAssignment2(x_vals,y_vals);


theta_j=atan(x_coord./y_coord) ;
identity_matrix = [1 0;0 1] ;
[dim1,dim2]=size(x_vals);
phi_ij=ones(dim1,2);
%forward_matrix=zeros(dim1,2);
%backward_matrix=zeros(dim1,2);
    for ele1=1:dim1
       phi_ij(ele1,:)= [(pi+theta_j(ele1))/(2*pi);(pi-theta_j(ele1))/(2*pi)] ;
    end
    phi_ij_new=phi_ij;
    init_message=[1 ;1];
    for ele2=1:dim1
        node_probability=phi_ij_new(ele2,:)'.*init_message ;
        phi_ij_new(ele2,:)=(identity_matrix*node_probability)' ;
        init_message=phi_ij_new(ele2,:)';
    end
    init_message=[1 ;1];
    for ele2=dim1:-1:1
        node_probability=phi_ij(ele2,:).*init_message ;
        phi_ij(ele2,:)=(identity_matrix*node_probability)';
        init_message=phi_ij(ele2,:)';
    end
    marginal_probabilities=zeros(dim1,2) ;
   for ele3=2:dim1-1
       marginal_probabilities(ele3,2)=phi_ij(ele3-1,2).*phi_ij_new(ele3+1,2) ;   
   end    
   marginal_probabilities=marginal_proobabilities/sum(sum(marginal_probabilities)) 
   marginal_probabilities=sum(marginal_probabilities) 
end