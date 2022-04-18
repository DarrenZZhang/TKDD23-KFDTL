function [train_data,train_data_label]=read_data(trainnum,canshu_num,cnum)

file_read = dir('C:\Users\Administrator\Desktop\pie20\05\*');
file_length = length(file_read);
% a=load('C:\Users\Administrator\Desktop\cv_learning\origin.mat')
tempdata=load('C:\Users\Administrator\Desktop\pie20\05\pie05_1.mat');
% a=tempdata.ar1;
% b=a.fts;
% c=a.labels;
dim=size(tempdata.fts,2);
folder='C:\Users\Administrator\Desktop\pie20\05\';

sample_num=0;
for i = 3:file_length%从第三个类开始，减掉前面的两个空文件
    file_name = file_read(i).name;%读入每一类的文件名
    filename=[folder file_name];%包含小文件及大文件夹的名字
    tempdata=load(filename);%tempdata结果里面有traindata和name
    data{i-2}=tempdata.fts;
    eachclass_num(i-2)=size(tempdata.fts,1);%eachclass_num(i-2)=size(b,1);
    sample_num= sample_num+eachclass_num(i-2);
end
%取每类的训练和测试样本 
Class =cnum;%类别数目10类
train_data=zeros(dim,Class*trainnum);%（dim=4imagenet56，总的训练数）全为0的矩阵
 m=0;%与下面m=m+(eachclass_num(j)-trainnum)相关
for j=1:Class
    randIdx=randperm(eachclass_num(j)-canshu_num)+canshu_num;

b_train=[1:canshu_num,randIdx(1:trainnum-canshu_num)];
train_num=b_train;%训练样本的序号
% test_num=b_test;%测试样本的序号
temp=data{j};%第j类样本比如第1类55×4imagenet56
temp1=temp(train_num,:);%temp1就是从某一类的所有样本中找到10个训练样本序号的样本10×4imagenet56
% temp2=temp(test_num,:);%temp2就是从某一类的所有样本中找到测试样本序号的样本45×4imagenet56
train_data(:,((j-1)*trainnum+1):((j-1)*trainnum+trainnum))=temp1';%让第1-10列等于temp1的转置 eg  A(:,(1:3))=A',这里是转置为4imagenet56×10
train_data_label(((j-1)*trainnum+1):((j-1)*trainnum+trainnum),1)=j;%标记训练样本是哪一类第1-10列等于1，11-20=2

m=m+(eachclass_num(j)-trainnum);%每到一个j就加一次测试数，最后总和应该是7667

clear temp1  temp
end

%归一化数据
train_data=normc(train_data);

