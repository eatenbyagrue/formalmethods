1;

function linearRegression ()
  [x,y] = loadData();  
  beta = computeSlope(x,y)
  alpha = computeIntercept(x,y,beta)
  
  # f represents the linear regression equation
  f = @(z) alpha + beta*z;
  
  R2 = computeRsquared (x, y, f)
  plotRegress(x,y,f);
endfunction

function [x,y] = loadData ()
  data = load("a6data.txt");
  x = data(:,2);
  y = data(:,3);
endfunction

function beta = computeSlope (x,y)
  x_m = mean(x);
  y_m = mean(y);
  beta = sum((x - x_m) .* (y - y_m)) / sum((x - x_m).^2)

endfunction

function alpha = computeIntercept (x, y, beta)
  alpha = mean(y) - (beta * mean (x));
endfunction

function R2 = computeRsquared (x, y, f)
  y_m = mean(y);
  R2 = sum((f(x) - y_m).^2) / sum((y - y_m).^2)
endfunction

function plotRegress (x,y, f)
  plot(x,y, 'rx', 'markersize', 8);
  hold on
  fplot (f, [min(x)-1 max(x)+1]);
  legend('Data', 'Regression');
  xlabel('Non-descript Variable X');
  ylabel('Not more descriptive Variable Y');
endfunction 

linearRegression();
clear functions;