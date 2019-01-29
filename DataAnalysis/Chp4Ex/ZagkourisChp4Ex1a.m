
h0V = 100;
hV = [60 54 58 60 56];
eV = sqrt(hV./h0V);
mean_eV = mean(eV);
SeV = std(eV);
S_mean_eV = SeV/sqrt(length(eV));

fprintf(['The mean restoration factor is %3f and the'...
    ' precision of each measurement is %3f \n'],mean_eV,SeV);

fprintf(['The mean restoration factor is %3f and the'...
    ' accuracy is %3f \n'],mean_eV,S_mean_eV);