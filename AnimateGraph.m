A = importdata('ForceCoefficient.dat');
x = A(:,1);
y = A(:,4);
z = A(:,5);
% Initialize video
myVideo = VideoWriter('Lift_110_50'); %open video file
myVideo.Quality=100;
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)

figure(1);
% subplot(2,1,2);
% plot(x,z,'r','LineWidth',1)
% xlabel('Cycle Time','FontSize',12)
% ylabel('C_{D} per wing','FontSize',12)
% axis([0 1 -8 30]);
% hold on
% p = plot(x(1),z(1),'ro','MarkerFaceColor','r',...
%                    'YDataSource','Z',...
%                    'XDataSource','X');
% 
% subplot(2,1,1);
plot(x,y,'k','LineWidth',1)
xlabel('Cycle Time','FontSize',12)
ylabel('Coefficient of Lift, C_{L}','FontSize',12)
axis([0 1 -4 7]);
hold on
h = plot(x(1),y(1),'ko','MarkerFaceColor','k',...
                   'YDataSource','Y',...
                   'XDataSource','X');
% h = subplot(x(1),z(1),'ro','MarkerFaceColor','r',...
%                    'YDataSource','Z',...
%                    'XDataSource','X');
for t = 1:100:numel(x)
    X = x(t);
    Y = y(t);
    Z = z(t);
    refreshdata(h,'caller');
%     refreshdata(p,'caller');
    %drawnow;
    
    set(gcf,'color','w');
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
    pause(.5);
end
close(myVideo)