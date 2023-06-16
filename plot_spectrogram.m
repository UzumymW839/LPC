function [] = plot_spectrogram(mSigIn, vTime, vFreq, sName)

mFFTOut = zeros(floor(size(mSigIn,1)/2),size(mSigIn,2));
for i = 1:size(mSigIn,2)
    vFFTOut = db(abs(fft(mSigIn(:,i))));
    mFFTOut(:,i) = vFFTOut(1:floor(end/2));
end

figure()
image(vTime,vFreq(1:round(end/2)),mFFTOut, 'CDataMapping', 'scaled')
colormap('turbo')
hcb = colorbar();
hcb.Title.String = ('dB');
xlabel('Time [s]')
ylabel('Frequency [Hz]')
title(['Spectrogram of ', sName])
axis xy

end
