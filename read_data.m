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
for i = 3:file_length%�ӵ������࿪ʼ������ǰ����������ļ�
    file_name = file_read(i).name;%����ÿһ����ļ���
    filename=[folder file_name];%����С�ļ������ļ��е�����
    tempdata=load(filename);%tempdata���������traindata��name
    data{i-2}=tempdata.fts;
    eachclass_num(i-2)=size(tempdata.fts,1);%eachclass_num(i-2)=size(b,1);
    sample_num= sample_num+eachclass_num(i-2);
end
%ȡÿ���ѵ���Ͳ������� 
Class =cnum;%�����Ŀ10��
train_data=zeros(dim,Class*trainnum);%��dim=4imagenet56���ܵ�ѵ������ȫΪ0�ľ���
 m=0;%������m=m+(eachclass_num(j)-trainnum)���
for j=1:Class
    randIdx=randperm(eachclass_num(j)-canshu_num)+canshu_num;

b_train=[1:canshu_num,randIdx(1:trainnum-canshu_num)];
train_num=b_train;%ѵ�����������
% test_num=b_test;%�������������
temp=data{j};%��j�����������1��55��4imagenet56
temp1=temp(train_num,:);%temp1���Ǵ�ĳһ��������������ҵ�10��ѵ��������ŵ�����10��4imagenet56
% temp2=temp(test_num,:);%temp2���Ǵ�ĳһ��������������ҵ�����������ŵ�����45��4imagenet56
train_data(:,((j-1)*trainnum+1):((j-1)*trainnum+trainnum))=temp1';%�õ�1-10�е���temp1��ת�� eg  A(:,(1:3))=A',������ת��Ϊ4imagenet56��10
train_data_label(((j-1)*trainnum+1):((j-1)*trainnum+trainnum),1)=j;%���ѵ����������һ���1-10�е���1��11-20=2

m=m+(eachclass_num(j)-trainnum);%ÿ��һ��j�ͼ�һ�β�����������ܺ�Ӧ����7667

clear temp1  temp
end

%��һ������
train_data=normc(train_data);

