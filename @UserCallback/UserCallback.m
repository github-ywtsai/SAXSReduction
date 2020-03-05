classdef UserCallback
    methods (Static = true)
        MasterInfo =ReadEigerHDF5Master(MasterFP);
        EigerData = ReadEigerHDF5Data(MasterFP,DataSNList);
    end
end