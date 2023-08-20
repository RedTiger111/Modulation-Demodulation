# Modulation & Demodulation

This project is Modulation & Demodulation in matlab.
Input # of symbols per frame & Modulation order. it can support 4-QAM,16-QAM,64-QAM and 256-QAM. 

## Simmulation Operation

- main.m
1. Enter # of symbols per frame & Modulation order.
2. Call Modulation function in Modulation.m
3. Adding AWGN channel
4. call Demodulation function in Demodulation.m
5. Figure BER graph

- Modulation.m
1. Fill binary data set using by randi.
2. Binary to gray code.
3. QAM constellation mapping.
4. I_Q normalization.
5. I_Q mapping.

- Demodulation.m
  
1. Reconstruction normalization.
2. Constellation approximation.
3. Demodulation.
4. Gray code to binary.
   
- awgn_noise.m
   Adding AWGN noise channel
