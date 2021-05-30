function win = windowGenerator(name,size)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

switch name
    case 'Bartlett-Hann';                   win = barthannwin(size);
    case 'Bartlett';                        win = bartlett(size);
    case 'Blackman';                        win = blackman(size);
    case 'Blackman-Harris';                 win = blackmanharris(size);
    case 'Bohman';                          win = bohmanwin(size);
    case 'Chebyshev';                       win = chebwin(size);
    case 'Flat Top';                        win = flattopwin(size);
    case 'Gaussian';                        win = gausswin(size);
    case 'Hamming';                         win = hamming(size);
    case 'Hann';                            win = hann(size);
    case 'Kaiser';                          win = kaiser(size);
    case 'Nuttall''s Blackman-Harris';      win = nuttallwin(size);
    case 'Parzen (de la Vallée-Poussin)';   win = parzenwin(size);
    case 'Rectangular';                     win = rectwin(size);
    case 'Tapered cosine';                  win = tukeywin(size);
    case 'Triangular';                      win = triang(size);
end