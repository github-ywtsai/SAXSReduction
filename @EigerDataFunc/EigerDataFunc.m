classdef EigerDataFunc
    methods (Static = true)
        MasterInfo =ReadEigerHDF5Master(MasterFP);
        DataOutput = ReadEigerHDF5Data(MasterInfo,RequestSN,XRange,YRange);
    end
end