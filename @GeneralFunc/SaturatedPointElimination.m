function ModifiedData = SaturatedPointElimination(RawData,BadPointMask)
RawData(BadPointMask) = 0;
ModifiedData = RawData;