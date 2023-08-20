function [signal_noise] = awgn_noise(signal,SNR)
    L=length(signal);
    SNR = 10.^(SNR./10); 
    Esym=sum(abs(signal).^2)/(L); 
    N0=Esym./SNR; 
    if (isreal(signal))
        noiseSigma = sqrt(N0);
        noise_power = noiseSigma*randn(1,L);
    else
        noiseSigma = sqrt(N0/2);
        noise_power = noiseSigma*(randn(1,L)+1i.*randn(1,L));
    end
    signal_noise = signal + noise_power;
end