bit_num = input("Number of symbols per frame : ");
r = input("Number of modulation order : ");

M=2^r;

%**********************awgn****************************************

if(r==1)
    EbNoVec = (0:25);       
elseif(r==2)
    EbNoVec = (0:25); 
elseif(r==4)
    EbNoVec = (0:25); 
elseif(r==6)
    EbNoVec = (0:25);
elseif(r==8)
    EbNoVec = (0:25);     
else
    EbNoVec = (0:10);
end

SNR =convertSNR(EbNoVec,"ebno","snr",BitsPerSymbol=r);


berEst = zeros(size(EbNoVec));

for (n = 1:1:length(SNR))
    [I_Q,data] = modulation(bit_num,r);
    [I_Q_noise] = awgn_noise(I_Q,SNR(n));
    [data_Rx] = demodulation(I_Q_noise,r);
    [data_row,data_col] = size(data_Rx);
    err_sum = 0;
    data_size = data_row * data_col;
    for (j = 1:1:data_col)
        for (i = 1:1:data_row)
                err_bit = biterr(data(i,j),data_Rx(i,j));
                err_sum = err_sum + err_bit;
        end
    end
            % Estimate the BER
    berEst(n) = err_sum/data_size;
end

berTheory = berawgn(EbNoVec,'qam',M);

semilogy(EbNoVec,berEst,'o')
hold on
semilogy(EbNoVec,berTheory)
hold on
xlim([0 25])
ylim([10^-5 1])
grid
if (r==2)
    legend('4-QAM','Theoretical BER');
    hold on
elseif (r==4)
    legend('16-QAM','Theoretical BER');
    hold on
elseif (r==6)
    legend('64-QAM','Theoretical BER');
    hold on
elseif (r==8)
    legend('256-QAM','Theoretical BER');
    hold on
else
    legend('BPSK','Theoretical BER');
    hold on
end
xlabel('Eb/No (dB)')
ylabel('BER')
