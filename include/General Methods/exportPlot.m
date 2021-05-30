function exportPlot(axes,name)
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

[filename, pathname, filterindex] = uiputfile( ...
    {'*.png', 'Portable Network Graphics (*.png)';
    '*.jpg', 'Joint Photographic Experts Group (*.jpg)';
    '*.pdf', 'Portable Document Format (*.pdf)';...
    '*.eps','Encapsulated PostScript (*.eps)';...
    '*.fig','MATLAB FIG-file (*.fig)'},...
    'Save graphic',[userpath,name,'.png']);
if filename==0; return; end

% Update userpath
userpath(pathname);

switch filterindex
    case 1 % PNG
        if ~endsWith(filename,'.png'); filename = [filename,'.png']; end
        exportgraphics(axes,[pathname,filename],'Resolution',300)
    case 2 % JPG
        if ~endsWith(filename,'.jpg'); filename = [filename,'.jpg']; end
        exportgraphics(axes,[pathname,filename],'Resolution',300)
    case 3 % PDF
        if ~endsWith(filename,'.pdf'); filename = [filename,'.pdf']; end
        warning('off','MATLAB:print:ContentTypeImageSuggested')
        exportgraphics(axes,[pathname,filename],'ContentType','vector')
    case 4 % EPS
        if ~endsWith(filename,'.eps'); filename = [filename,'.eps']; end
        warning('off','MATLAB:print:ContentTypeImageSuggested')
        exportgraphics(axes,[pathname,filename],'ContentType','vector')
    case 5 % Fig
        if ~endsWith(filename,'.fig'); filename = [filename,'.fig']; end
        fignew = figure('Visible','off','Color',[1 1 1]); % Invisible figure
        axeB = gca(fignew);
        newAxes = copyobj(axes,fignew); % Copy the appropriate axes
        set(newAxes,'Units',axeB.Units,...
            'Position',axeB.Position,'InnerPosition',axeB.InnerPosition,...
            'PositionConstraint','outerposition');
        delete(axeB);
        set(fignew,'CreateFcn','set(gcbf,''Visible'',''on'')');
        saveas(fignew,[pathname,filename])
        delete(fignew);
end