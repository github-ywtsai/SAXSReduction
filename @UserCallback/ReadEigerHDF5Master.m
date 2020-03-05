function MasterInfo =ReadEigerHDF5Master(MasterFP)
setenv('HDF5_PLUGIN_PATH','/blsw/opt/areaDetector/root/usr/lib/h5plugin');

[MasterFF MasterFN] = AnalyzeMasterFP(MasterFP);

MasterInfo.MasterFF = MasterFF;
MasterInfo.MasterFN = MasterFN;
MasterInfo.MasterFP = MasterFP;
MasterInfo.BitDepthImage = double(h5read(MasterFP,'/entry/instrument/detector/bit_depth_image'));
MasterInfo.BadPointValue = power(2,MasterInfo.BitDepthImage)-1;
MasterInfo.XPixelsInDetector = double(h5read(MasterFP,'/entry/instrument/detector/detectorSpecific/x_pixels_in_detector'));
MasterInfo.YPixelsInDetector = double(h5read(MasterFP,'/entry/instrument/detector/detectorSpecific/y_pixels_in_detector'));
MasterInfo.CountTime = double(h5read(MasterFP,'/entry/instrument/detector/count_time'));
MasterInfo.DetectorDistance = double(h5read(MasterFP,'/entry/instrument/detector/detector_distance')); % [m]
MasterInfo.XPixelSize = double(h5read(MasterFP,'/entry/instrument/detector/x_pixel_size')); % [m]
MasterInfo.YPixelSize = double(h5read(MasterFP,'/entry/instrument/detector/y_pixel_size')); % [m]
MasterInfo.Wavelength = double(h5read(MasterFP,'/entry/instrument/beam/incident_wavelength'))*1E-10; % read as [A], save as [m]
MasterInfo.BeamCenterX= round(double(h5read(MasterFP,'/entry/instrument/detector/beam_center_x')));
MasterInfo.BeamCenterY= round(double(h5read(MasterFP,'/entry/instrument/detector/beam_center_y')));
MasterInfo.PixelMask = logical(transpose(h5read(MasterFP,'/entry/instrument/detector/detectorSpecific/pixel_mask')));



temp = h5info(MasterFP,'/entry/data');

function [MasterFF,MasterFN] = AnalyzeMasterFP(MasterFP)

[MasterFF,MasterFN,MasterEXT] = fileparts(MasterFP);
MasterFN = [MasterFN MasterEXT];

if ~strcmpi(MasterFP, fullfile(MasterFF,MasterFN))
    error('Master file name analyze fault.')
end