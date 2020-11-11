% waterbomb_geometry_simulation
clear
clc

n=3;
alpha=pi/n;
beta=2*alpha;
r=1;
theta=pi/2;

d=acos((cos(theta)).^2+cos(beta).*(sin(theta)).^2);
gamma1=acos(cos(alpha)./cos(d/2));
gamma2=acos(cos(theta)./cos(d/2));

gamma=gamma1+gamma2;
rho_vector=0:.1:r;
T_vector=0:alpha:2*pi;

for i=1:2*n
    
    if rem(i,2)==1
        Phi=theta-pi/2;
    else
        Phi=gamma-pi/2;
    end
    
    for j=1:length(rho_vector)
        [x,y,z]=sph2cart(T_vector(i),Phi,rho_vector(j));
        X(i,j)=x;
        Y(i,j)=y;
        Z(i,j)=z;        
    end
    
    
    
end

figure
for ii=1:2*n
      
    if ii==2*n
        jj=1;
    else
        jj=ii+1;
        
    end
    
    x_fill = [X(ii,:) fliplr(X(jj,:))];
    y_fill = [Y(ii,:) fliplr(Y(jj,:))];
    z_fill = [Z(ii,:) fliplr(Z(jj,:))];
    
        
    if rem(ii,2)==1
       
        fill3(x_fill,y_fill,z_fill, 'r');
        hold on
    
    else
        
        fill3(x_fill,y_fill,z_fill, 'b');
        hold on
        
    end
        
    
    

end

xlabel('x')
ylabel('y')
zlabel('z')
