 

function [Train_label]=Train_label_110(Train1_label,train1_data_label)
    Train_label=[];
    Train_label(1:8,:)=Train1_label(1:8,:);
    Train_label(9:11,:)=train1_data_label(1:3,:);
    
    Train_label(12:19,:)=Train1_label(9:16,:);
    Train_label(20:22,:)=train1_data_label(4:6,:);
    
    Train_label(23:30,:)=Train1_label(17:24,:);
    Train_label(31:33,:)=train1_data_label(7:9,:);
    
    Train_label(34:41,:)=Train1_label(25:32,:);
    Train_label(42:44,:)=train1_data_label(10:12,:);
    
    Train_label(45:52,:)=Train1_label(33:40,:);
    Train_label(53:55,:)=train1_data_label(13:15,:);
    
    Train_label(56:63,:)=Train1_label(41:48,:);
    Train_label(64:66,:)=train1_data_label(16:18,:);
    
    Train_label(67:74,:)=Train1_label(49:56,:);
    Train_label(75:77,:)=train1_data_label(19:21,:);
    
    Train_label(78:85,:)=Train1_label(57:64,:);
    Train_label(86:88,:)=train1_data_label(22:24,:);
    
    Train_label(89:96,:)=Train1_label(65:72,:);
    Train_label(97:99,:)=train1_data_label(25:27,:);
    
    Train_label(100:107,:)=Train1_label(73:80,:);
    Train_label(108:110,:)=train1_data_label(28:30,:);