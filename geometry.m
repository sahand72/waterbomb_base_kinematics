clear
clc

n=3; %number of valley/mountain folds

alpha=pi/n;         %sector angles
beta=(2*pi)/n;      %angle between two identical folds

theta=linspace(pi/180,pi-alpha,500);  %angle between the valley fold and the vertical axis

d=acos((cos(theta)).^2+cos(beta)*(sin(theta)).^2);

gamma_mountain=-pi+acos(1+(cos(d)-1)/((sin(alpha)).^2));

for theta_counter=1:length(theta)
    
    if theta(theta_counter)<=pi/2
        
        gamma_valley(theta_counter)=-pi+2*acos(cot(alpha)*tan(d(theta_counter)/2))+2*acos(cot(theta(theta_counter))*tan(d(theta_counter)/2));
        
    else
        
        gamma_valley(theta_counter)=pi-2*acos((cos(d(theta_counter))-1)*(cot(theta(theta_counter))/(sin(d(theta_counter)))))+2*acos(cot(alpha)*tan(d(theta_counter)/2));
        
    end
    
end

figure(1)
plot(radtodeg(gamma_mountain),radtodeg(gamma_valley),'LineWidth',2)
xlabel('gamma_ mountain')
ylabel('gamma- valley')


figure(2)
plot(radtodeg(theta),-radtodeg(gamma_mountain),'LineWidth',2)
hold on
plot(radtodeg(theta),radtodeg(gamma_valley),'LineWidth',2)

xlabel('theta')
legend('gamma_ mountain','gamma_ valley')
