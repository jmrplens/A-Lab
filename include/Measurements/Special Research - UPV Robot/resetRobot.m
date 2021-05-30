function resetRobot()
% Copyright (C) Jose M. Requena Plens 
% joreple@upv.es - jmrplens.github.io

respX=webread('http://192.168.4.1/movexy?json={"axis":{"X":{"RESET":1}}}\n');
respX=webread('http://192.168.4.1/movexy?json={"axis":{"Y":{"RESET":1}}}\n');
respX=webread('http://192.168.4.1/movexy?json={"axis":{"Z":{"RESET":1}}}\n')