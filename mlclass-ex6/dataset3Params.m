function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


%C_values = [0.01 0.03 0.1 0.3 1 3 10 30];
%sigma_values = [0.01 0.03 0.1 0.3 1 3 10 30];
%
%for i=1:length(C_values)
%    for j=1:length(sigma_values)
%        C = C_values(i);
%        sigma = sigma_values(j);
%        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
%        predictions = svmPredict(model, Xval);
%        predictions_error(i,j) = mean(double(predictions ~= yval));
%    end
%end
%
%mm = min(min(predictions_error));
%[i j] = find(predictions_error == mm);
%C = C_values(i)
%sigma = sigma_values(j)

% the above algo will be wrong when you submit,maybe there are two same
% min element in the matrix.


C_vec = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_vec = [0.01 0.03 0.1 0.3 1 3 10 30];
error_min = realmax;

for i = 1:length(C_vec)
  C_i = C_vec(i);
  for j = 1:length(sigma_vec)
    sigma_j = sigma_vec(j);
    model= svmTrain(X, y, C_i, @(x1, x2) gaussianKernel(x1, x2, sigma_j));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    if error < error_min
      error_min = error;
      C = C_i;
      sigma = sigma_j;
    end;
  end;
end;


% =========================================================================

end
