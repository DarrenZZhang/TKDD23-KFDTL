 function [tr_all]=tr_all_110(tr_dat,train1_data)
    %每类源域样本取8个，目标域训练样本取3个
    tr_all=[];
    tr_all(:,1:8)=tr_dat(:,1:8);
    tr_all(:,9:11)=train1_data(:,1:3);
    
    tr_all(:,12:19)=tr_dat(:,9:16);
    tr_all(:,20:22)=train1_data(:,4:6);
    
    tr_all(:,23:30)=tr_dat(:,17:24);
    tr_all(:,31:33)=train1_data(:,7:9);
    
    tr_all(:,34:41)=tr_dat(:,25:32);
    tr_all(:,42:44)=train1_data(:,10:12);
    
    tr_all(:,45:52)=tr_dat(:,33:40);
    tr_all(:,53:55)=train1_data(:,13:15);
    
    tr_all(:,56:63)=tr_dat(:,41:48);
    tr_all(:,64:66)=train1_data(:,16:18);
    
    tr_all(:,67:74)=tr_dat(:,49:56);
    tr_all(:,75:77)=train1_data(:,19:21);
    
    tr_all(:,78:85)=tr_dat(:,57:64);
    tr_all(:,86:88)=train1_data(:,22:24);
    
    tr_all(:,89:96)=tr_dat(:,65:72);
    tr_all(:,97:99)=train1_data(:,25:27);
    
    tr_all(:,100:107)=tr_dat(:,73:80);
    tr_all(:,108:110)=train1_data(:,28:30);