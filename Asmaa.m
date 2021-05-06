close all
clear 
clc

fs = 100;            %sampling rate
startEpoch = 0.5;    %an epoch starts 0.5s after the cue
endEpoch = 2.5;      %an epoch ends 2.5s after the cue 
nbSamplesPerTrial = ceil((endEpoch - startEpoch) * fs);
    
    load('BCICIV_calib_ds1a.mat');
   
    cnt= 0.1*double(cnt);
 
    %perform band-pass filtering with a butterworth filter if needed
       
    order = 8; 
    
    [B,A] = butter(order/2,[7 30]/(fs/2));   % [8 30]
    
    nbChannels = size(cnt,2);
    
    labels = mrk.y;
    labels(labels==-1) = 2;
    
    cues = mrk.pos;
    
    Indexes = find(~isnan(labels));
  
%     nbTrainTrials = length(mrk.y);
    
    nbTrials = length(Indexes);
    disp(['nbTrials = ' num2str(nbTrials)]);
    
    %initializing structures
    disp('initializing structures...');
    
    EEGSignals.x = zeros(nbChannels, nbSamplesPerTrial, nbTrials);
    EEGSignals.y = labels;
    EEGSignals.s = fs;
    EEGSignals.c = nfo.clab;
    
    %assigning data to the corresponding structure
    disp('assigning data to the corresponding structure...');
    
    for trial=1:nbTrials    
        
        cueIndex = cues(Indexes(trial));
        
        epoch = cnt((cueIndex + round(startEpoch*fs)):(cueIndex + round(endEpoch*fs))-1,:);
        epoch = filter(B,A,epoch);
        
        EEGSignals.x(:,:,trial) = epoch';
    end
    
    sample_data = EEGSignals.x;
    Actual_class = EEGSignals.y;
    
    
    
