function createRightStandardPanel(app)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

% Set column
column = rightGrid(app,{'1x'},{'fit', 'fit', '1x', 'fit'});

% Signal panel
Row = 1; Col = 1;
availableSignals = {'Sweep', 'MLS', 'White Noise', 'Pink Noise', 'Pure tone','Custom Signal'};
createPanelSignal(app,column,Row,Col,availableSignals);

% Button Measurement
Row = 2; Col = 1;
createPanelMeasure(app,column,Row,Col);

% Information panel
Row = 4; Col = 1;
createPanelInformation(app,column,Row,Col);