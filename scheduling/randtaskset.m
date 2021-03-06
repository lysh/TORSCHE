function rtaskset = randtaskset(nbTasks,varargin)
% RANDTASKSET Generates set of tasks of random parameters selected from uniform distribution.
%
% Synopsis
%    RTASKSET =
%    RANDTASKSET(nbTasks,[Name,]ProcTime[,ReleaseTime[,Deadline ...
%                [,DueDate[,Weight[,Processor]]]]])
%
% Description
%    Function has following parameters:
%      nbTasks:
%                   - number of tasks in set of tasks
%      Name:
%                   - name of the tasks (must by char!)
%      ProcTime:
%                   - range of processing time (execution time)
%      ReleaseTime:
%                   - range of release date (arrival time)
%      Deadline:
%                   - range of deadline
%      DueDate:
%                   - range of due date
%      Weight:
%                   - range of weight (priotiry)
%      Processor:
%                   - range of dedicated processor
%
%    The output RTASKSET is a TASKSET object.
%
% See also TASKSET/TASKSET


% Author: M. Stibor
% Originator: Michal Kutil <kutilm@fel.cvut.cz>
% Originator: Premysl Sucha <suchap@fel.cvut.cz>
% Project Responsible: Zdenek Hanzalek
% Department of Control Engineering
% FEE CTU in Prague, Czech Republic
% Copyright (c) 2004 - 2009 
% $Revision: 2895 $  $Date:: 2009-03-18 11:24:58 +0100 #$


% This file is part of TORSCHE Scheduling Toolbox for Matlab.
% TORSCHE Scheduling Toolbox for Matlab can be used, copied 
% and modified under the next licenses
%
% - GPL - GNU General Public License
%
% - and other licenses added by project originators or responsible
%
% Code can be modified and re-distributed under any combination
% of the above listed licenses. If a contributor does not agree
% with some of the licenses, he/she can delete appropriate line.
% If you delete all lines, you are not allowed to distribute 
% source code and/or binaries utilizing code.
%
% --------------------------------------------------------------
%                  GNU General Public License  
%
% TORSCHE Scheduling Toolbox for Matlab is free software;
% you can redistribute it and/or modify it under the terms of the
% GNU General Public License as published by the Free Software
% Foundation; either version 2 of the License, or (at your option)
% any later version.
% 
% TORSCHE Scheduling Toolbox for Matlab is distributed in the hope
% that it will be useful, but WITHOUT ANY WARRANTY;
% without even the implied warranty of MERCHANTABILITY or 
% FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with TORSCHE Scheduling Toolbox for Matlab; if not, write
% to the Free Software Foundation, Inc., 59 Temple Place,
% Suite 330, Boston, MA 02111-1307 USA



for i=1:nbTasks
    rtask = randtask(varargin{:});
    if i==1
        rtaskset = [rtask];
    else
        rtaskset = [rtaskset rtask];
    end
end

% if name is defined, index it!
if nargin>=1
    if isa(varargin{1},'char')
        for i=1:nbTasks
            names{i} = [varargin{1} '_{' num2str(i) '}'];
        end
        rtaskset.Name = names;
    end
end

% end of RANDTASKSET
