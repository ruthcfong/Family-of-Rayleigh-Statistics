function plot_circle(r,x,y,format,title_text)
    %r is the radius of the circle
    %x and y are the coordinates of the center of the circle
    %0.01 is the angle step, bigger values will draw the circle faster but
    %you might notice imperfections (not very smooth)
    %
    %modified from http://uk.mathworks.com/matlabcentral/answers/3058-plotting-circles
    if ~exist('r','var')
        r=1;
    end
    if ~exist('x','var')
        x=0;
    end
    if ~exist('y','var')
        y=0;
    end
    if ~exist('format','var')
        format='b-';
    end
    ang=0:0.01:2*pi;
    xp=r*cos(ang);
    yp=r*sin(ang);
    hold on;
    plot(x+xp,y+yp,format);
    if exist('title_text','var')
        title(title_text);
    end
    hold off;
    axis equal;
end