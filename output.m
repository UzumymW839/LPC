function [mOutput, iSamplesPerBlock, iSamplesPerShift, iNumBlocks, iSamplesMat] = output(vSignal, iFs, fBlockLength, fShift)

iSamplesPerBlock = round(fBlockLength*iFs);
iSamplesPerShift = round(fShift*iFs);
iNumBlocks = ceil((length(vSignal)-iSamplesPerBlock+iSamplesPerShift)/iSamplesPerShift);

mOutput = zeros(iSamplesPerBlock, iNumBlocks);

% calculate the processing length of the matrix
iSamplesMat = (iNumBlocks-1)*iSamplesPerShift+iSamplesPerBlock;

% append zeros to the signal to fit to the matrix
vSignal = [vSignal; 10^-40*ones(iSamplesMat-length(vSignal),1)];

for i = 1:iNumBlocks
    mOutput(:,i) = vSignal((i-1)*iSamplesPerShift+1:(i-1)*iSamplesPerShift+iSamplesPerBlock);
end

end