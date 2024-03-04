A = importdata('ForceCoefficient.dat');
x = A(:,1);    % 1st column as x axis
y = A(:,4);    % 4th column as y axis
z = A(:,5);    % 5th column as z axis
% Initialize video
myVideo = VideoWriter('Lift_110_50'); %open video file
myVideo.Quality=100;
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)

figure(1);
plot(x,y,'k','LineWidth',1)    % Plotting y with respect to x axis
xlabel('Cycle Time','FontSize',12)  %Label x axis
ylabel('Coefficient of Lift, C_{L}','FontSize',12) %Label y axis and choose font size
axis([0 1 -4 7]);  % Choose x-limit and y-limit of graph
hold on
h = plot(x(1),y(1),'ko','MarkerFaceColor','k',...
                   'YDataSource','Y',...
                   'XDataSource','X');    % Placing a pointer at 1st value

for t = 1:100:numel(x)      %Create a for loop with spacing of 100th value of data
    X = x(t);
    Y = y(t);
    Z = z(t);
    refreshdata(h,'caller');    % Refresh the data pointer at 100th interval
    
    set(gcf,'color','w');
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);      % Write the video
    pause(.5);
end
close(myVideo)
