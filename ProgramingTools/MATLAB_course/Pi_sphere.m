function Pi_sphere(varargin)
%%
%27
fprintf('Number of arguments: %d\n',nargin)
celldisp(varargin)
nargin
varargin
Defaults = {25,24};
Defaults(1:nargin) = varargin

imax = Defaults{1};
nmax = Defaults{2}
tic;
timedur = toc;
for i=1:imax
    tic;
    
    if i <= nmax
        [Is(i),pi_me(i),pi_er(i),timepi(i),Vc,points]=Pi_spheref(2^i);
        if i == 14
            figure();
            plot3(Vc(1,points),Vc(2,points),Vc(3,points),'rx');
            hold on;
            plot3(Vc(1,~points),Vc(2,~points),Vc(3,~points),'b.');
            hold off;
            legend('Points in','Points out','Location', 'Best');
            title('MC simulation data for Pi');
        end
    else
        nloops = 2^(i-nmax);
        %disp(num2str(nloops));
        [Ib,pi_meb,pi_erb,timepib,Vcb,pointsb]=Pi_spheref(2^nmax);
        sumbin = sum(pointsb);
        stdbin = std(pointsb);
        
        parfor ia=2:nloops
            %disp('In loop');
            [Ia,pi_mea,pi_era,timepia,Vca,pointsa]=Pi_spheref(2^nmax);
            %Ib = Ib + Ia;
            sumbin2(ia) = sum(pointsa);
            %stdbin2(ia) = sqrt((stdbin^2+std(pointsa)^2)/2);
            stdbin2(ia) = std(pointsa);
            timepib = timepib+timepia;
            %Vcb = Vcb + Vca;
            %pointsb = pointsb + pointsa;
        end
        sumbin = sumbin + sum(sumbin2);
        stdbin = sqrt((stdbin^2+sum(stdbin2.^2))/nloops);
        Ntotal = 2^i;
        pi_meb = 6*sumbin/(Ntotal);% The calculated values of Pi
        pi_erb = 6*stdbin/sqrt(Ntotal); %The Standard Error of Pi
        [Is(i),pi_me(i),pi_er(i),timepi(i),Vc,points] = deal(Ib,pi_meb,pi_erb,timepib,Vcb,pointsb);
        
    end
    timedur=toc;
    timerem = timedur*(2^(imax-i+1)-1)/60;
    checkVar = whos;
    for kl = 1:length(checkVar);
        DF(kl) = checkVar(kl).bytes;
    end
    in_use = sum(DF)/1024^2;
    clc;
    fprintf('%.2f%% Completed, Estimated remaining time %.2f minutes Total MB in use %f',100*i/imax,timerem,in_use);


end

% [I_sorted, I_order] = sort(Is);
% pi_me = pi_me(I_order);
% pi_er = pi_er(I_order);
% timepi = timepi(I_order);

for o=1:imax
    fprintf('Calculated Pi is %.8f with a Standard Error of %.8f and actual Pi is %.8f \n',pi_me(o),pi_er(o),pi);
end

figure();
errorbar(2.^(1:imax),pi_me,pi_er,'o');
title('Calculated value of Pi and errors');
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
xlabel('Number of vectors');
ylabel('Value of Pi');
hold on;
plot([2^1,2^imax],[pi,pi],'r--');
legend('MC Pi','Pi','Location', 'Best');
figure();
yyaxis left;
plot(2.^(1:imax),timepi);
title('Total run time and error');
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
xlabel('Number of vectors');
ylabel('Time calculating Pi (s)');
yyaxis right;
plot(2.^(1:imax),pi_er);
ylabel('Error in Pi');
set(gca, 'YScale', 'log');
legend('Time','Error','Location', 'Best');
%%
end

function [M,pi_me,pi_er,timeout,Vc,pointers]=Pi_spheref(N)

%Calculate the value of Pi using MonteCarlo comparing the volumes of a
%sphere and a cube
tic;
%N is the number of random vectros to create
M=N;
Vc = 2*rand(3,N)-1; %The 3D vectors in the (-1,1) region
Norm = sqrt(Vc(1,:).^2+Vc(2,:).^2+Vc(3,:).^2);%Magnitude of vectors
pointers = Norm<1;%The vectros with a magnitude less than 1, inside the sphere
% Vc_in = Vc(pointers);%The positions of the points inside the sphere
% Vc_out = Vc(1-pointers);%The points outside
pi_me = 6*sum(pointers)/N;% The calculate values of Pi
pi_er = 6*std(pointers)/sqrt(N); %The Standard Error of Pi
timeout=toc;
end
