%——————————程序———————————
function [D,X,obj] =gaikernel_Learn_D_X(train_data,Dinit,Xinit,alpha,beta,gam,gams,max_iter,U,Y_range)
        options.ker = 'rbf';        % kernel: 'linear' | 'rbf' | 'lap'
        options.eta = 1.1;          % eigenspectrum damping factor
        
L_size1=size(Dinit,2);
D=Dinit;
X=full(Xinit);%将稀疏矩阵变为全矩阵



% % MMD
 
%  n_s=train_num*c;%200个
% n_t=train_num1*c;%30个
n_s=400;
n_t=40;
w=n_s+n_t;
M=[w,w];
for i =1:n_s
    for j =1:n_s
 M(i,j)=1/(n_s*n_s);
    end
end   
 for i =n_s+1:w
    for j =n_s+1:w
  M(i,j)=1/(n_t*n_t);
    end
 end
 for i =1:n_s
     for j =n_s+1:w
          M(i,j)=-1/(n_s*n_t);
     end
 end
  for i =n_s+1:w
     for j =1:n_s
          M(i,j)=-1/(n_s*n_t);
     end
  end    
  M;
  lamad=1;
% a=diag(M);
%  S=diag(a);
iter=0;

while iter < max_iter
iter=iter+1;

%Mx = buildMean(X);
Mx=buildM_2M(X, Y_range, beta);
%修改地方
% A=pinv(alpha*U+X*X')*X';%上次修改
%  A=X'*pinv(alpha*U+X*X');%XIUGAI
% A=X'*pinv(alpha*U+X*X');
 A=X'*pinv(alpha*U+X*X'+gams*eye(L_size1));
%  X=pinv(beta*U+(2*beta+gam)*eye(L_size1)+lamad*M)*(kernel(D,train_data)-Mx);
% K = kernel(options.ker, [Xs, Xt], []);kernel(linear,train_data,train_data)
 X=pinv(beta*U+(2*beta+gam)*eye(L_size1)+lamad*M)*((pinv(X*X'+alpha*U+gams*eye(L_size1)))'*X*kernel(options.ker,train_data,train_data)-Mx);
% X=pinv(beta*U+(2*beta+gam)*eye(L_size1)+lamad*M)*(A'*kernel(train_data,train_data)-Mx);%行不通

% X=pinv(D'*D+(2*beta+gam)*eye(L_size1)+lamad*M)*(D'*train_data-Mx);
%   A=(D'*D+beta*U+(2*beta+gam)*eye(L_size1))/lamad;
%   B=M;
%   C=(D'*train_data-Mx)/lamad;
%   C1=reshape(C',52900,1);%将C拉成一列
% %   X=inv(kron(A,eye(230))+kron(eye(230),B'))*C1;
%   X=(kron(A,eye(230))+kron(eye(230),B'))\C1;
  
%Updata D
% D=sqrt((pinv(X*X'+alpha*U+gams*eye(L_size1)))'*X*kernel(train_data,train_data)*X'*pinv(X*X'+alpha*U+gams*eye(L_size1)));
 D=(train_data*X')*pinv(X*X'+alpha*U+gams*eye(L_size1));%上次修改
% a=(train_data-D*X)*(train_data-D*X)';
% b=alpha*trace(D*U*D');
% c=beta*trace(X'*U*X);
% d=beta*trace(X*U*X');
% e=gam*X*X';
% f=gams*D*D';
% g=lamad*trace(X'*M*X);
% h=norm(train_data-D*X);
% q=gam*norm(X);
% p=gams*norm(D);
% obj(iter)=norm(train_data-D*X)+alpha*trace(D*U*D')+beta*trace(X'*U*X)+beta*trace(X*U*X')+gam*norm(X)+gams*norm(D)+lamad*trace(X'*M*X);
% obj(iter)=norm(train_data-D*X)+alpha*trace(D*U*D')+beta*trace(X'*U*X)+beta*trace(X*U*X')+gam*norm(X)+gams*norm(D)+lamad*trace(X'*M*X);
% obj(iter)=trace((eye(L_size1)-A*X)'*kernel(train_data,train_data)*(eye(L_size1)-A*X))+alpha*trace(kernel(train_data,train_data)*A*U*A')+beta*trace(X'*U*X)+beta*trace(X*U*X')+gam*norm(X)+lamad*trace(X'*M*X);
obj(iter)=trace((eye(L_size1)-A*X)'*kernel(options.ker,train_data,train_data)*(eye(L_size1)-A*X))+alpha*trace(A'*kernel(options.ker,train_data,train_data)*A*U)+beta*trace(X'*U*X)+beta*trace(X*U*X')+gam*norm(X)+lamad*trace(X'*M*X);

% %  MMD=trace(X*M);
% % min(min(MMD));%最小化源域和目标域之间的分布差异

end 
end

% function [K]=kernel(fea_a,fea_b)
% K=fea_a'*fea_b;



function K = kernel(ker, X, X2, gamma)

if ~exist('ker', 'var')
    ker = 'linear';
end
if ~exist('gamma', 'var')
    gamma = 1e-1;%1.0
end

switch ker
    case 'linear'
        if isempty(X2)
            K = X' * X;
        else
            K = X' * X2;
        end
        
    case 'rbf'
        n1sq = sum(X.^2, 1);
        n1 = size(X, 2);
        if isempty(X2)
            D = (ones(n1, 1) * n1sq)' + ones(n1, 1) * n1sq -2 * (X' * X);
        else
            n2sq = sum(X2.^2, 1);
            n2 = size(X2, 2);
            D = (ones(n2, 1) * n1sq)' + ones(n1, 1) * n2sq -2 * X' * X2;
        end
        gamma = gamma / mean(mean(D));
        K = exp(-gamma * D);
        
    case 'lap'
        n1sq = sum(X.^2, 1);
        n1 = size(X, 2);
        if isempty(X2)
            D = (ones(n1, 1) * n1sq)' + ones(n1, 1) * n1sq -2 * (X' * X);
        else
            n2sq = sum(X2.^2, 1);
            n2 = size(X2, 2);
            D = (ones(n2, 1) * n1sq)' + ones(n1, 1) * n2sq -2 * X' * X2;
        end
        gamma = gamma / mean(mean(D));
        K = exp(-sqrt(gamma * D));
        
    otherwise
        error(['Unsupported kernel ' ker])
end

if size(K, 1) == size(K, 2)
    K = (K + K') / 2;
end

end



