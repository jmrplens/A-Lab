function [optRoute,minDist] = optimizeRouteRobot(coordsu,travelDist,ax,pp,type)

switch type
    case 1
        % ====================================================
        % Optimize
        % point to point distances/costs (dmat)
        nPoints = size(coordsu,1);
        a = meshgrid(1:nPoints);
        dmat = reshape(sqrt(sum((coordsu(a,:)-coordsu(a',:)).^2,2)),nPoints,nPoints);
        
        
        % Verify Inputs
        n = size(coordsu,1);
        
        % Sanity Checks
        popcases = 22;
        popSize     = popcases*1000;%round(1600/popcases)*popcases;
        numIter     = 500;
        
        % Initialize the Population
        pop = zeros(popSize,n);
        pop(1,:) = (1:n);
        for k = 2:popSize
            pop(k,:) = randperm(n);
        end
        
        % Run the GA
        globalMin = travelDist; % Condition dist
        mindistaux = travelDist;
        optRoute = 1:nPoints;
        totalDist = zeros(1,popSize);
        distHistory = zeros(1,numIter);
        tmpPop = zeros(popcases,n);
        newPop = zeros(popSize,n);
        exit = 100;
        
        rng default
        for iter = 1:numIter
            % Evaluate Each Population Member (Calculate Total Distance)
            for p = 1:popSize
                d = dmat(pop(p,n),pop(p,1)); % Closed Path
                for k = 2:n
                    d = d + dmat(pop(p,k-1),pop(p,k));
                end
                totalDist(p) = d;
            end
            
            % Find the Best Route in the Population
            [minDist,index] = min(totalDist);
            distHistory(iter) = minDist;
            if minDist < globalMin
                globalMin = minDist;
                optRoute = pop(index,:);
                rte = optRoute([1:n 1]);
                coordsaux = coordsu(rte,:);
                
                % Route
                set(pp,'XData',coordsaux(:,1),'YData',coordsaux(:,2))
                mindistaux = minDist;
            else
                exit = exit -1;
            end
            if exit <= 0
                break;
            end
            set(ax.Title,'String',[...
                sprintf('Travel distance: %.2f m - Optimized distance: %.2f m [Stable: %.1f',travelDist,mindistaux,1/exit*100),...
                '\%]']);
            drawnow limitrate
            
            
            % Genetic Algorithm Operators
            randomOrder = randperm(popSize);
            for p = popcases:popcases:popSize
                rtes = pop(randomOrder(p-(popcases-1):p),:);
                dists = totalDist(randomOrder(p-(popcases-1):p));
                [ignore,idx] = min(dists); %#ok
                bestOf4Route = rtes(idx,:);
                routeInsertionPoints = sort(ceil(n*rand(1,2)));
                I = routeInsertionPoints(1);
                J = routeInsertionPoints(2);
                tmpPop(1,:) = bestOf4Route;
                for k = 1:popcases % Mutate the Best to get Three New Routes
                    tmpPop(k,:) = bestOf4Route;
                    switch k
                        case 2 % Flip
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I); % Flip
                        case 3 % Swap
                            tmpPop(k,[I J]) = tmpPop(k,[J I]); % Swap
                        case 4 % Slide
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]); % Slide
                        case 5 % Flip & Swap
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                        case 6 % Flip & Slide
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                        case 7 % Swap & Slide
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                        case 8 % Swap & Flip
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                        case 9 % Slide & Flip
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                        case 10 % Slide & Swap
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                        case 11 % Flip & Swap & Slide
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                        case 12 % Flip & Slide & Swap
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                        case 13 % Slide & Flip & Swap
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                        case 14 % Slide & Swap & Flip
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                        case 15 % Swap & Slide & Flip
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                        case 16 % Swap & Flip & Slide
                            tmpPop(k,[I J]) = tmpPop(k,[J I]);
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I);
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]);
                        case 17 % Flip Swap Flip
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I); % Flip
                            tmpPop(k,[I J]) = tmpPop(k,[J I]); % Swap
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I); % Flip
                        case 18 % Flip Slide Flip
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I); % Flip
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]); % Slide
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I); % Flip
                        case 19 % Swap Flip Swap
                            tmpPop(k,[I J]) = tmpPop(k,[J I]); % Swap
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I); % Flip
                            tmpPop(k,[I J]) = tmpPop(k,[J I]); % Swap
                        case 20 % Swap Slide Swap
                            tmpPop(k,[I J]) = tmpPop(k,[J I]); % Swap
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]); % Slide
                            tmpPop(k,[I J]) = tmpPop(k,[J I]); % Swap
                        case 21 % Slide Flip Slide
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]); % Slide
                            tmpPop(k,I:J) = tmpPop(k,J:-1:I); % Flip
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]); % Slide
                        case 22 % Slide Swap Slide
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]); % Slide
                            tmpPop(k,[I J]) = tmpPop(k,[J I]); % Swap
                            tmpPop(k,I:J) = tmpPop(k,[I+1:J I]); % Slide
                            
                        otherwise % Do Nothing
                    end
                end
                newPop(p-(popcases-1):p,:) = tmpPop;
            end
            pop = newPop;
            
            
            
        end
        
        
        if minDist > globalMin
            minDist = globalMin;
        end
        
    case 2
        
        
end