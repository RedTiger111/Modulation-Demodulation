function[data_Rx] = demodulation(I_Q_noise,r) 
    %*************  Demodulation ******************************************

    %*************  Resolve normalization *********************************
    %***************at BPSK************************************************
    if (r==1)                
        factor = 1;
    %***************at QPSK************************************************
    elseif (r==2)            
        factor = 1/sqrt(2);
    %***************at 16-QAM**********************************************
    elseif (r==4)           
        factor = 1/sqrt(10);
    %***************at 64-QAM**********************************************
    elseif (r==6)            
        factor = 1/sqrt(4);
    %***************at 256-QAM*********************************************
    elseif (r==8)            
        factor = 1/sqrt(170);
    else
        factor = 1;
    end

    for (i = 1:1:length(I_Q_noise))
        I_noise_nor(i) = real(I_Q_noise(i));
        I_noise(i)     = I_noise_nor(i)/factor;
        Q_noise_nor(i) = imag(I_Q_noise(i));
        Q_noise(i)     = Q_noise_nor(i)/factor;
    end



    %************* Constellation approximation ****************************
    %****************************BPSK constellation approximation**********
    if (r==1)
        for(i = 1:1:length(I_noise))
            if (I_noise(i) < 0)
                I_R(i) = -1;
                Q_R(i) = 0;
            else
                I_R(i) = +1;
                Q_R(i) = 0; 
            end
        end
    %****************************QPSK constellation approximation**********    
    elseif (r==2)
        for(i = 1:1:length(I_noise))
            if (I_noise(i) <0)
                I_R(i) = -1;
            else
                I_R(i) = +1;
            end
        end
        for(i = 1:1:length(I_noise))
            if(Q_noise(i) <0)
                Q_R(i) = -1;
            else
                Q_R(i) = +1;
            end
        end
    %****************************16-QAM constellation approximation********   
    elseif(r==4)
        for(i = 1:1:length(I_noise))
            if (I_noise(i) <-2)
                I_R(i) = -3;
            elseif ((-2<=I_noise(i)) && (I_noise(i)<0))
                I_R(i) = -1;
            elseif ((0<=I_noise(i)) && (I_noise(i) <2))
                I_R(i) = +1;
            else
                I_R(i) = +3;
            end
        end
        for(i = 1:1:length(I_noise))
            if (Q_noise(i) <-2)
                Q_R(i) = -3;
            elseif ((-2<=Q_noise(i)) && (Q_noise(i)<0))
                Q_R(i) = -1;
            elseif ((0<=Q_noise(i)) && (Q_noise(i)<2))
                Q_R(i) = +1;
            else
                Q_R(i) = +3;
            end
        end
    %****************************64-QAM constellation approximation********
    elseif(r==6)
        for(i = 1:1:length(I_noise))
            if (I_noise(i) <-6)
                I_R(i) = -7;
            elseif ((-6<=I_noise(i)) && (I_noise(i)<-4))
                I_R(i) = -5;
            elseif ((-4<=I_noise(i)) && (I_noise(i)<-2))
                I_R(i) = -3;
            elseif ((-2<=I_noise(i)) && (I_noise(i)<0))
                I_R(i) = -1;
            elseif ((0<=I_noise(i)) && (I_noise(i)<2))
                I_R(i) = +1;
            elseif ((2<=I_noise(i)) && (I_noise(i)<4))
                I_R(i) = +3;
            elseif ((4<=I_noise(i)) && (I_noise(i)<6))
                I_R(i) = +5;
            else
                I_R(i) = +7;
            end
        end
        for(i = 1:1:length(I_noise))
            if (Q_noise(i) <-6)
                Q_R(i) = -7;
            elseif ((-6<=Q_noise(i)) && (Q_noise(i)<-4))
                Q_R(i) = -5;
            elseif ((-4<=Q_noise(i)) && (Q_noise(i)<-2))
                Q_R(i) = -3;
            elseif ((-2<=Q_noise(i)) && (Q_noise(i)<0))
                Q_R(i) = -1;
            elseif ((0<=Q_noise(i)) && (Q_noise(i)<2))
                Q_R(i) = +1;
            elseif ((2<=Q_noise(i)) && (Q_noise(i)<4))
                Q_R(i) = +3;
            elseif ((4<=Q_noise(i)) && (Q_noise(i)<6))
                Q_R(i) = +5;
            else
                Q_R(i) = +7;
            end
        end
    %****************************256-QAM constellation approximation*******
    else
        for(i = 1:1:length(I_noise))
            if (I_noise(i) <-14)
                I_R(i) = -15;
            elseif ((-14<=I_noise(i)) && (I_noise(i)<-12))
                I_R(i) = -13;
            elseif ((-12<=I_noise(i)) && (I_noise(i)<-10))
                I_R(i) = -11;
            elseif ((-10<=I_noise(i)) && (I_noise(i)<-8))
                I_R(i) = -9;
            elseif ((-8<=I_noise(i)) && (I_noise(i)<-6))
                I_R(i) = -7;
            elseif ((-6<=I_noise(i)) && (I_noise(i)<-4))
                I_R(i) = -5;
            elseif ((-4<=I_noise(i)) && (I_noise(i)<-2))
                I_R(i) = -3;
            elseif ((-2<=I_noise(i)) && (I_noise(i)<0))
                I_R(i) = -1;
            elseif ((0<=I_noise(i)) && (I_noise(i)<2))
                I_R(i) = +1;
            elseif ((2<=I_noise(i)) && (I_noise(i)<4))
                I_R(i) = +3;
            elseif ((4<=I_noise(i)) && (I_noise(i)<6))
                I_R(i) = +5;
            elseif ((6<=I_noise(i)) && (I_noise(i)<8))
                I_R(i) = +7;
            elseif ((8<=I_noise(i)) && (I_noise(i)<10))
                I_R(i) = +9;
            elseif ((10<=I_noise(i)) && (I_noise(i)<12))
                I_R(i) = +11;
            elseif ((12<=I_noise(i)) && (I_noise(i)<14))
                I_R(i) = +13;
            else
                I_R(i) = +15;
            end
        end
        for(i = 1:1:length(I_noise))
            if (Q_noise(i) <-14)
                Q_R(i) = -15;
            elseif ((-14<=Q_noise(i)) && (Q_noise(i)<-12))
                Q_R(i) = -13;
            elseif ((-12<=Q_noise(i)) && (Q_noise(i)<-10))
                Q_R(i) = -11;
            elseif ((-10<=Q_noise(i)) && (Q_noise(i)<-8))
                Q_R(i) = -9;
            elseif ((-8<=Q_noise(i)) && (Q_noise(i)<-6))
                Q_R(i) = -7;
            elseif ((-6<=Q_noise(i)) && (Q_noise(i)<-4))
                Q_R(i) = -5;
            elseif ((-4<=Q_noise(i)) && (Q_noise(i)<-2))
                Q_R(i) = -3;
            elseif ((-2<=Q_noise(i)) && (Q_noise(i)<0))
                Q_R(i) = -1;
            elseif ((0<=Q_noise(i)) && (Q_noise(i)<2))
                Q_R(i) = +1;
            elseif ((2<=Q_noise(i)) && (Q_noise(i)<4))
                Q_R(i) = +3;
            elseif ((4<=Q_noise(i)) && (Q_noise(i)<6))
                Q_R(i) = +5;
            elseif ((6<=Q_noise(i)) && (Q_noise(i)<8))
                Q_R(i) = +7;
            elseif ((8<=Q_noise(i)) && (Q_noise(i)<10))
                Q_R(i) = +9;
            elseif ((10<=Q_noise(i)) && (Q_noise(i)<12))
                Q_R(i) = +11;
            elseif ((12<=Q_noise(i)) && (Q_noise(i)<14))
                Q_R(i) = +13;
            else
                Q_R(i) = +15;
            end
        end
    end


    %****************************Demodulation******************************
    %****************************BPSK Demodulation*************************
    if (r==1)
        for (i= 1:1:length(I_R))
            if((I_R(i)== -1) && (Q_R(i) == 0))
                can_data_R(:,i)="0";
            else
                can_data_R(:,i)="1";
            end
        for (i = 1:1:length(Q_R))
            data_R(i) = can_data_R(1,i);
        end
        end
    %****************************QPSK Demodulation*********************
    elseif (r==2)
        for (i = 1:1:length(I_R))
            if (I_R(i)==-1)
                can_data_R(1,i) ="00";
                can_data_R(2,i) ="01";
            else
                can_data_R(1,i) ="10";
                can_data_R(2,i) ="11";
            end
        end
        for (i = 1:1:length(Q_R))
            if (Q_R(i)==-1)
                data_R(i) = can_data_R(1,i);
            else
                data_R(i) = can_data_R(2,i);
            end
        end
    %****************************16-QAM Demodulation*******************
    elseif (r==4)
        for (i = 1:1:length(I_R))
            if (I_R(i)==-3)
                can_data_R(1,i) = "0000";
                can_data_R(2,i) = "0001";
                can_data_R(3,i) = "0011";
                can_data_R(4,i) = "0010";
            elseif (I_R(i)==-1)
                can_data_R(1,i) = "0100";
                can_data_R(2,i) = "0101";
                can_data_R(3,i) = "0111";
                can_data_R(4,i) = "0110";
            elseif (I_R(i)==+1)
                can_data_R(1,i) = "1100";
                can_data_R(2,i) = "1101";
                can_data_R(3,i) = "1111";
                can_data_R(4,i) = "1110";
            else
                can_data_R(1,i) = "1000";
                can_data_R(2,i) = "1001";
                can_data_R(3,i) = "1011";
                can_data_R(4,i) = "1010";
            end
        end
        for (i = 1:1:length(Q_R))
            if (Q_R(i)==-3)
                data_R(i) = can_data_R(4,i);
            elseif (Q_R(i)==-1)
                data_R(i) = can_data_R(3,i);
            elseif (Q_R(i)==+1)
                data_R(i) = can_data_R(2,i);
            else
                data_R(i) = can_data_R(1,i);
            end
        end
    %****************************64-QAM Demodulation*******************
    elseif (r==6)
        for (i = 1:1:length(I_R))
            if (I_R(i)==-7)
                can_data_R(1,i) = "000000";
                can_data_R(2,i) = "000001";
                can_data_R(3,i) = "000011";
                can_data_R(4,i) = "000010";
                can_data_R(5,i) = "000110";
                can_data_R(6,i) = "000111";
                can_data_R(7,i) = "000101";
                can_data_R(8,i) = "000100";           
            elseif (I_R(i)==-5)
                can_data_R(1,i) = "001000";
                can_data_R(2,i) = "001001";
                can_data_R(3,i) = "001011";
                can_data_R(4,i) = "001010";
                can_data_R(5,i) = "001110";
                can_data_R(6,i) = "001111";
                can_data_R(7,i) = "001101";
                can_data_R(8,i) = "001100"; 
            elseif (I_R(i)==-3)
                can_data_R(1,i) = "011000";
                can_data_R(2,i) = "011001";
                can_data_R(3,i) = "011011";
                can_data_R(4,i) = "011010";
                can_data_R(5,i) = "011110";
                can_data_R(6,i) = "011111";
                can_data_R(7,i) = "011101";
                can_data_R(8,i) = "011100"; 
            elseif (I_R(i)==-1)
                can_data_R(1,i) = "010000";
                can_data_R(2,i) = "010001";
                can_data_R(3,i) = "010011";
                can_data_R(4,i) = "010010";
                can_data_R(5,i) = "010110";
                can_data_R(6,i) = "010111";
                can_data_R(7,i) = "010101";
                can_data_R(8,i) = "010100"; 
            elseif (I_R(i)==+1)
                can_data_R(1,i) = "110000";
                can_data_R(2,i) = "110001";
                can_data_R(3,i) = "110011";
                can_data_R(4,i) = "110010";
                can_data_R(5,i) = "110110";
                can_data_R(6,i) = "110111";
                can_data_R(7,i) = "110101";
                can_data_R(8,i) = "110100"; 
            elseif (I_R(i)==+3)
                can_data_R(1,i) = "111000";
                can_data_R(2,i) = "111001";
                can_data_R(3,i) = "111011";
                can_data_R(4,i) = "111010";
                can_data_R(5,i) = "111110";
                can_data_R(6,i) = "111111";
                can_data_R(7,i) = "111101";
                can_data_R(8,i) = "111100";
            elseif (I_R(i)==+5)
                can_data_R(1,i) = "101000";
                can_data_R(2,i) = "101001";
                can_data_R(3,i) = "101011";
                can_data_R(4,i) = "101010";
                can_data_R(5,i) = "101110";
                can_data_R(6,i) = "101111";
                can_data_R(7,i) = "101101";
                can_data_R(8,i) = "101100"; 
            else
                can_data_R(1,i) = "100000";
                can_data_R(2,i) = "100001";
                can_data_R(3,i) = "100011";
                can_data_R(4,i) = "100010";
                can_data_R(5,i) = "100110";
                can_data_R(6,i) = "100111";
                can_data_R(7,i) = "100101";
                can_data_R(8,i) = "100100"; 
            end
        end
            for (i = 1:1:length(Q_R))
            if (Q_R(i)==-7)
                data_R(i) = can_data_R(1,i);
            elseif (Q_R(i)==-5)
                data_R(i) = can_data_R(2,i);
            elseif (Q_R(i)==-3)
                data_R(i) = can_data_R(3,i);
            elseif (Q_R(i)==-1)
                data_R(i) = can_data_R(4,i);
            elseif (Q_R(i)==+1)
                data_R(i) = can_data_R(5,i);
            elseif (Q_R(i)==+3)
                data_R(i) = can_data_R(6,i);
            elseif (Q_R(i)==+5)
                data_R(i) = can_data_R(7,i);
            else
                data_R(i) = can_data_R(8,i);
            end
        end
    %****************************256-QAM Demodulation******************
    else %(r=8)************************************************************
        for (i =1:1:length(I_R))
            if (I_R(i)==-15)
                can_data_R(1,i) ="00000000";
                can_data_R(2,i) ="00000001";
                can_data_R(3,i) ="00000011";
                can_data_R(4,i) ="00000010";
                can_data_R(5,i) ="00000110";
                can_data_R(6,i) ="00000111";
                can_data_R(7,i) ="00000101";
                can_data_R(8,i) ="00000100"; 
                can_data_R(9,i) ="00001100";
                can_data_R(10,i) ="00001101";
                can_data_R(11,i) ="00001111";
                can_data_R(12,i) ="00001110";
                can_data_R(13,i) ="00001010";
                can_data_R(14,i) ="00001011";
                can_data_R(15,i) ="00001001";
                can_data_R(16,i) ="00001000";   
            elseif (I_R(i)==-13)
                can_data_R(1,i) ="00010000";
                can_data_R(2,i) ="00010001";
                can_data_R(3,i) ="00010011";
                can_data_R(4,i) ="00010010";
                can_data_R(5,i) ="00010110";
                can_data_R(6,i) ="00010111";
                can_data_R(7,i) ="00010101";
                can_data_R(8,i) ="00010100"; 
                can_data_R(9,i) ="00011100";
                can_data_R(10,i) ="00011101";
                can_data_R(11,i) ="00011111";
                can_data_R(12,i) ="00011110";
                can_data_R(13,i) ="00011010";
                can_data_R(14,i) ="00011011";
                can_data_R(15,i) ="00011001";
                can_data_R(16,i) ="00011000"; 
            elseif (I_R(i)==-11)
                can_data_R(1,i) ="00110000";
                can_data_R(2,i) ="00110001";
                can_data_R(3,i) ="00110011";
                can_data_R(4,i) ="00110010";
                can_data_R(5,i) ="00110110";
                can_data_R(6,i) ="00110111";
                can_data_R(7,i) ="00110101";
                can_data_R(8,i) ="00110100"; 
                can_data_R(9,i) ="00111100";
                can_data_R(10,i) ="00111101";
                can_data_R(11,i) ="00111111";
                can_data_R(12,i) ="00111110";
                can_data_R(13,i) ="00111010";
                can_data_R(14,i) ="00111011";
                can_data_R(15,i) ="00111001";
                can_data_R(16,i) ="00111000"; 
            elseif (I_R(i)==-9)
                can_data_R(1,i) ="00100000";
                can_data_R(2,i) ="00100001";
                can_data_R(3,i) ="00100011";
                can_data_R(4,i) ="00100010";
                can_data_R(5,i) ="00100110";
                can_data_R(6,i) ="00100111";
                can_data_R(7,i) ="00100101";
                can_data_R(8,i) ="00100100"; 
                can_data_R(9,i) ="00101100";
                can_data_R(10,i) ="00101101";
                can_data_R(11,i) ="00101111";
                can_data_R(12,i) ="00101110";
                can_data_R(13,i) ="00101010";
                can_data_R(14,i) ="00101011";
                can_data_R(15,i) ="00101001";
                can_data_R(16,i) ="00101000"; 
            elseif (I_R(i)==-7)
                can_data_R(1,i) ="01100000";
                can_data_R(2,i) ="01100001";
                can_data_R(3,i) ="01100011";
                can_data_R(4,i) ="01100010";
                can_data_R(5,i) ="01100110";
                can_data_R(6,i) ="01100111";
                can_data_R(7,i) ="01100101";
                can_data_R(8,i) ="01100100"; 
                can_data_R(9,i) ="01101100";
                can_data_R(10,i) ="01101101";
                can_data_R(11,i) ="01101111";
                can_data_R(12,i) ="01101110";
                can_data_R(13,i) ="01101010";
                can_data_R(14,i) ="01101011";
                can_data_R(15,i) ="01101001";
                can_data_R(16,i) ="01101000"; 
            elseif (I_R(i)==-5)
                can_data_R(1,i) ="01110000";
                can_data_R(2,i) ="01110001";
                can_data_R(3,i) ="01110011";
                can_data_R(4,i) ="01110010";
                can_data_R(5,i) ="01110110";
                can_data_R(6,i) ="01110111";
                can_data_R(7,i) ="01110101";
                can_data_R(8,i) ="01110100"; 
                can_data_R(9,i) ="01111100";
                can_data_R(10,i) ="01111101";
                can_data_R(11,i) ="01111111";
                can_data_R(12,i) ="01111110";
                can_data_R(13,i) ="01111010";
                can_data_R(14,i) ="01111011";
                can_data_R(15,i) ="01111001";
                can_data_R(16,i) ="01111000"; 
            elseif (I_R(i)==-3)
                can_data_R(1,i) ="01010000";
                can_data_R(2,i) ="01010001";
                can_data_R(3,i) ="01010011";
                can_data_R(4,i) ="01010010";
                can_data_R(5,i) ="01010110";
                can_data_R(6,i) ="01010111";
                can_data_R(7,i) ="01010101";
                can_data_R(8,i) ="01010100"; 
                can_data_R(9,i) ="01011100";
                can_data_R(10,i) ="01011101";
                can_data_R(11,i) ="01011111";
                can_data_R(12,i) ="01011110";
                can_data_R(13,i) ="01011010";
                can_data_R(14,i) ="01011011";
                can_data_R(15,i) ="01011001";
                can_data_R(16,i) ="01011000"; 
            elseif (I_R(i)==-1)
                can_data_R(1,i) ="01000000";
                can_data_R(2,i) ="01000001";
                can_data_R(3,i) ="01000011";
                can_data_R(4,i) ="01000010";
                can_data_R(5,i) ="01000110";
                can_data_R(6,i) ="01000111";
                can_data_R(7,i) ="01000101";
                can_data_R(8,i) ="01000100"; 
                can_data_R(9,i) ="01001100";
                can_data_R(10,i) ="01001101";
                can_data_R(11,i) ="01001111";
                can_data_R(12,i) ="01001110";
                can_data_R(13,i) ="01001010";
                can_data_R(14,i) ="01001011";
                can_data_R(15,i) ="01001001";
                can_data_R(16,i) ="01001000"; 
            elseif (I_R(i)==+1)
                can_data_R(1,i) ="11000000";
                can_data_R(2,i) ="11000001";
                can_data_R(3,i) ="11000011";
                can_data_R(4,i) ="11000010";
                can_data_R(5,i) ="11000110";
                can_data_R(6,i) ="11000111";
                can_data_R(7,i) ="11000101";
                can_data_R(8,i) ="11000100"; 
                can_data_R(9,i) ="11001100";
                can_data_R(10,i) ="11001101";
                can_data_R(11,i) ="11001111";
                can_data_R(12,i) ="11001110";
                can_data_R(13,i) ="11001010";
                can_data_R(14,i) ="11001011";
                can_data_R(15,i) ="11001001";
                can_data_R(16,i) ="11001000"; 
            elseif (I_R(i)==+3)
                can_data_R(1,i) ="11010000";
                can_data_R(2,i) ="11010001";
                can_data_R(3,i) ="11010011";
                can_data_R(4,i) ="11010010";
                can_data_R(5,i) ="11010110";
                can_data_R(6,i) ="11010111";
                can_data_R(7,i) ="11010101";
                can_data_R(8,i) ="11010100"; 
                can_data_R(9,i) ="11011100";
                can_data_R(10,i) ="11011101";
                can_data_R(11,i) ="11011111";
                can_data_R(12,i) ="11011110";
                can_data_R(13,i) ="11011010";
                can_data_R(14,i) ="11011011";
                can_data_R(15,i) ="11011001";
                can_data_R(16,i) ="11011000";
            elseif (I_R(i)==+5)
                can_data_R(1,i) ="11110000";
                can_data_R(2,i) ="11110001";
                can_data_R(3,i) ="11110011";
                can_data_R(4,i) ="11110010";
                can_data_R(5,i) ="11110110";
                can_data_R(6,i) ="11110111";
                can_data_R(7,i) ="11110101";
                can_data_R(8,i) ="11110100"; 
                can_data_R(9,i) ="11111100";
                can_data_R(10,i) ="11111101";
                can_data_R(11,i) ="11111111";
                can_data_R(12,i) ="11111110";
                can_data_R(13,i) ="11111010";
                can_data_R(14,i) ="11111011";
                can_data_R(15,i) ="11111001";
                can_data_R(16,i) ="11111000";
            elseif (I_R(i)==+7)
                can_data_R(1,i) ="11100000";
                can_data_R(2,i) ="11100001";
                can_data_R(3,i) ="11100011";
                can_data_R(4,i) ="11100010";
                can_data_R(5,i) ="11100110";
                can_data_R(6,i) ="11100111";
                can_data_R(7,i) ="11100101";
                can_data_R(8,i) ="11100100"; 
                can_data_R(9,i) ="11101100";
                can_data_R(10,i) ="11101101";
                can_data_R(11,i) ="11101111";
                can_data_R(12,i) ="11101110";
                can_data_R(13,i) ="11101010";
                can_data_R(14,i) ="11101011";
                can_data_R(15,i) ="11101001";
                can_data_R(16,i) ="11101000";
            elseif (I_R(i)==+9)
                can_data_R(1,i) ="10100000";
                can_data_R(2,i) ="10100001";
                can_data_R(3,i) ="10100011";
                can_data_R(4,i) ="10100010";
                can_data_R(5,i) ="10100110";
                can_data_R(6,i) ="10100111";
                can_data_R(7,i) ="10100101";
                can_data_R(8,i) ="10100100"; 
                can_data_R(9,i) ="10101100";
                can_data_R(10,i) ="10101101";
                can_data_R(11,i) ="10101111";
                can_data_R(12,i) ="10101110";
                can_data_R(13,i) ="10101010";
                can_data_R(14,i) ="10101011";
                can_data_R(15,i) ="10101001";
                can_data_R(16,i) ="10101000";
            elseif (I_R(i)==+11)
                can_data_R(1,i) ="10110000";
                can_data_R(2,i) ="10110001";
                can_data_R(3,i) ="10110011";
                can_data_R(4,i) ="10110010";
                can_data_R(5,i) ="10110110";
                can_data_R(6,i) ="10110111";
                can_data_R(7,i) ="10110101";
                can_data_R(8,i) ="10110100"; 
                can_data_R(9,i) ="10111100";
                can_data_R(10,i) ="10111101";
                can_data_R(11,i) ="10111111";
                can_data_R(12,i) ="10111110";
                can_data_R(13,i) ="10111010";
                can_data_R(14,i) ="10111011";
                can_data_R(15,i) ="10111001";
                can_data_R(16,i) ="10111000";
            elseif (I_R(i)==+13)
                can_data_R(1,i) ="10010000";
                can_data_R(2,i) ="10010001";
                can_data_R(3,i) ="10010011";
                can_data_R(4,i) ="10010010";
                can_data_R(5,i) ="10010110";
                can_data_R(6,i) ="10010111";
                can_data_R(7,i) ="10010101";
                can_data_R(8,i) ="10010100"; 
                can_data_R(9,i) ="10011100";
                can_data_R(10,i) ="10011101";
                can_data_R(11,i) ="10011111";
                can_data_R(12,i) ="10011110";
                can_data_R(13,i) ="10011010";
                can_data_R(14,i) ="10011011";
                can_data_R(15,i) ="10011001";
                can_data_R(16,i) ="10011000";    
            else
                can_data_R(1,i) ="10000000";
                can_data_R(2,i) ="10000001";
                can_data_R(3,i) ="10000011";
                can_data_R(4,i) ="10000010";
                can_data_R(5,i) ="10000110";
                can_data_R(6,i) ="10000111";
                can_data_R(7,i) ="10000101";
                can_data_R(8,i) ="10000100"; 
                can_data_R(9,i) ="10001100";
                can_data_R(10,i) ="10001101";
                can_data_R(11,i) ="10001111";
                can_data_R(12,i) ="10001110";
                can_data_R(13,i) ="10001010";
                can_data_R(14,i) ="10001011";
                can_data_R(15,i) ="10001001";
                can_data_R(16,i) ="10001000";
            end
        end
        for (i = 1:1:length(Q_R))
            if (Q_R(i)==-15)
                data_R(i) = can_data_R(1,i);
            elseif (Q_R(i)==-13)
                data_R(i) = can_data_R(2,i);
            elseif (Q_R(i)==-11)
                data_R(i) = can_data_R(3,i);
            elseif (Q_R(i)==-9)
                data_R(i) = can_data_R(4,i);
            elseif (Q_R(i)==-7)
                data_R(i) = can_data_R(5,i);
            elseif (Q_R(i)==-5)
                data_R(i) = can_data_R(6,i);
            elseif (Q_R(i)==-3)
                data_R(i) = can_data_R(7,i);
            elseif (Q_R(i)==-1)
                data_R(i) = can_data_R(8,i);
            elseif (Q_R(i)==+1)
                data_R(i) = can_data_R(9,i);
            elseif (Q_R(i)==+3)
                data_R(i) = can_data_R(10,i);
            elseif (Q_R(i)==+5)
                data_R(i) = can_data_R(11,i);
            elseif (Q_R(i)==+7)
                data_R(i) = can_data_R(12,i);
            elseif (Q_R(i)==+9)
                data_R(i) = can_data_R(13,i);  
            elseif (Q_R(i)==+11)
                data_R(i) = can_data_R(14,i);
            elseif (Q_R(i)==+13)
                data_R(i) = can_data_R(15,i); 
            else
                data_R(i) = can_data_R(16,i);
            end
        end
    end


    for (i=1:1:length(data_R))
        for(j=1:1:r)
        k1=extractAfter(data_R(i),j-1); 
        k2=extractAfter(data_R(i),j);
        if (k2=="")
            k2="0";
        else
            k2=k2;
        end
        data_k1(j) = str2double(k1);
        data_k2(j) = str2double(k2);
        data_Rx(j,i) = (data_k1(j) - data_k2(j));
        end
    end

    for (i=1:1:length(data_Rx))
        for(j=1:1:r)
            if (data_Rx(j,i) == 10000000)
                data_Rx(j,i) = 1;
            elseif (data_Rx(j,i) == 1000000)
                data_Rx(j,i) = 1;
            elseif (data_Rx(j,i) == 100000)
                data_Rx(j,i) = 1;
            elseif (data_Rx(j,i) == 10000)
                data_Rx(j,i) = 1;
            elseif (data_Rx(j,i) == 1000)
                data_Rx(j,i) = 1;
            elseif (data_Rx(j,i) == 100)
                data_Rx(j,i) = 1;
            elseif (data_Rx(j,i) == 10)
                data_Rx(j,i) = 1;    
            elseif (data_Rx(j,i) == 1)
                data_Rx(j,i) = 1; 
            else
                data_Rx(j,i) = 0;
            end
        end
    end


    [data_Rx_row,data_Rx_col] = size(data_Rx);

    for (j = 1:1:data_Rx_col)
        for (i = 1:1:data_Rx_row)
            if (i==1)
                data_Rx_bin(i,j) = data_Rx(i,j);
            else
                data_Rx_bin(i,j) = xor(data_Rx(i-1,j),data_Rx(i,j));
            end
        end
    end
end